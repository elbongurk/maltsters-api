class MaltAnalyzer < Struct.new(:malt)
  def average(field)
    column = analyses[field]
    sql = joins.project(column.average).where(conditions(column)).to_sql
    value = ActiveRecord::Base.connection.select_value(sql)
    value && BigDecimal.new(value)
  end
  
  private

  def conditions(column)
    distance = Arel::Nodes::NamedFunction.new('STDDEV', [column])
    low = joins.project(Arel::Nodes::Subtraction.new(column.average, distance))
    high = joins.project(Arel::Nodes::Addition.new(column.average, distance))
    column.gteq(low).and(column.lteq(high))
  end

  def joins
    analyses.join(lots).on(relationship)
  end

  def relationship
    analyses[:lot_id].eq(lots[:id]).and(lots[:malt_id].eq(malt.id))
  end

  def analyses
    Analysis.arel_table
  end

  def lots
    Lot.arel_table
  end
end
