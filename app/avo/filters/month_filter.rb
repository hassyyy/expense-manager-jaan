class MonthFilter < Avo::Filters::SelectFilter
  self.name = 'Month'

  def apply(request, query, value)
    query.where(month: value)
  end

  def options
    AppOptions::MONTHS.hashify
  end

  def default
    CreditCard.first.present? ? CreditCard.first.current_month.strftime("%b") : Date.today.strftime("%b")
  end

  def react
    if applied_filters["CreditCardFilter"].present? &&
       applied_filters["MonthFilter"].blank? &&
       (applied_filters["YearFilter"].blank? || applied_filters["YearFilter"].eql?(Date.today.year))
      card = CreditCard.find(applied_filters["CreditCardFilter"])
      card.current_month.strftime("%b")
    end
  end
end
