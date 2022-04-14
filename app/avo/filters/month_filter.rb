class MonthFilter < Avo::Filters::SelectFilter
  self.name = 'Month'

  def apply(request, query, value)
    query.where(month: value)
  end

  def options
    AppOptions::MONTHS.hashify
  end

  def default
    Date.today.strftime("%b")
  end
end
