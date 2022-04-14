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
    date = (Date.today.day <= model.billing_day) ? Date.today.last_month : Date.today
    model.transactions.where(month: date.strftime("%b"), year: date.year).sum(:amount)
  end

  field :current_balance, as: :number do |model, resource, view|
    date = (Date.today.day <= model.billing_day) ? Date.today : Date.today.next_month
    model.transactions.where(month: date.strftime("%b"), year: date.year).sum(:amount)
  end

end
