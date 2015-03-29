require 'open-uri'

namespace :fetch do
  desc "Fetch lots from malsters"
  task :lots => :environment do
    buffer = open(ENV['CMG_LIST_URL']).read
    skus = buffer.split(':').sort    
    malster = nil
    malt = nil
    skus.each do |sku|
      code = sku.gsub(/[^A-Z0-9]/i, '').upcase
      if malster.nil? || code[0..1] != malster.code
        malster = Maltster.includes(:malts).where(code: code[0..1]).take
        malt = nil
      end
      if malster
        if malt.nil? || !code.starts_with?(malster.code + malt.code)
          malt = malster.malts.find do |m|
            code.starts_with?(malster.code + m.code)
          end
        end
        if malt
          lot_code = code[(malster.code.size + malt.code.size)..-1]          
          unless lot_code.empty? || malt.lots.where(code: lot_code).exists?
            Lot.create(code: lot_code, sku: sku, malt: malt)
          end
        end
      end
    end
  end

  desc "Fetch analyses from malsters"
  task :analyses => :environment do
    Lot.unanalyzed.each do |lot|
      param = Rack::Utils.escape(lot.sku)
      buffer = open("#{ENV['CMG_SHOW_URL']}?lotVal=#{param}").read

      if buffer != 'ufail'
        hash = Hash.from_xml("<root>#{buffer}</root>")
        data = hash['root']['li']

        Analysis.create(lot: lot) do |a|
          a.name = data[0] if data[0].present?
          a.moisture = data[1].to_f if data[1].present?
          a.fine_grind_as_is = data[2].to_f if data[2].present?
          a.fine_grind_dry_basis = data[3].to_f if data[3].present?
          a.coarse_grind_as_is = data[4].to_f if data[4].present?
          a.coarse_grind_dry_basis = data[5].to_f if data[5].present?
          a.fine_coarse_grind_diff = data[6].to_f if data[6].present?
          a.lovibond = data[7].to_f if data[7].present?
          a.diastatic_power = data[8].to_f if data[8].present?
          a.alpha_amylase = data[9].to_f if data[9].present?
          a.total_protein = data[10].to_f if data[10].present?
          a.soluble_nitrogen = data[11].to_f if data[11].present?
          a.viscosity = data[12].to_f if data[12].present?
          a.beta_glucan = data[13].to_f if data[13].present?
          a.assortment_1 = data[14].to_f if data[14].present?
          a.assortment_2 = data[15].to_f if data[15].present?
          a.assortment_thru = data[16].to_f if data[16].is_a? String
        end
      end

      sleep(10)
    end
  end
end

desc "Fetch objects from malsters"
task :fetch => ["fetch:lots", "fetch:analyses"]
