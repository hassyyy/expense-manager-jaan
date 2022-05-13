class CreditCardFilter < Avo::Filters::SelectFilter
  self.name = 'Credit Card'

  def apply(request, query, value)
    query.where(credit_card_id: value)
  end

  def options
    CreditCard.select(:id, :name).each_with_object({}) { |card, options| options[card.id] = card.name }
  end

  def default
    params[:id] || CreditCard.first&.id
  end
end
