class YearFilter < Avo::Filters::SelectFilter
  self.name = 'Year'

  def apply(request, query, value)
    query.where(year: value)
  end

  def options
    AppOptions::YEARS.hashify
  end

  def default
    Date.today.year
  end
end
