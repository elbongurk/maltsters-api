namespace :analyze do
  desc "Refresh analysis records for malts"
  task :malts => :environment do
    Malt.includes(:analysis).all.each do |malt|
      analyzer = MaltAnalyzer.new(malt)
      analysis = malt.analysis || Analysis.new(malt: malt)
      
      Analysis::FIELDS.each do |field|
        avg = analyzer.average(field)
        analysis[field] = avg && avg.round(2)
      end

      analysis.save
    end
  end
end

