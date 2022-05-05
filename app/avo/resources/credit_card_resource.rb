class CreditCardResource < Avo::BaseResource
  self.title = :name
  self.includes = []
  self.record_selector = false
  self.after_create_path = :index
  self.after_update_path = :index

  def navigation_label; "Cards" end

  field :name, as: :text, link_to_resource: true, required: true
  field :billing_day, as: :number, min: 1, max: 31, required: true
  field :transactions, as: :has_many
  field :loans, as: :has_many

  field :previous_balance, as: :number do |model, resource, view|
    model.transactions.where(month: model.previous_month.strftime("%b"), year: model.previous_month.year).sum(:amount)
  end

  field :current_balance, as: :number do |model, resource, view|
    model.transactions.where(month: model.current_month.strftime("%b"), year: model.current_month.year).sum(:amount)
  end

end
