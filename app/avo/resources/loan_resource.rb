class LoanResource < Avo::BaseResource
  self.title = :name
  self.includes = []
  self.record_selector = false
  self.after_create_path = :index
  self.after_update_path = :index

  field :name, as: :text, link_to_resource: true, required: true
  field :amount, as: :number, placeholder: 'EMI', required: true
  field :credit_card, as: :belongs_to
  field :tenure, as: :number, min: 3, default: 12, placeholder: 'Months', required: true
  field :start_date, as: :date, required: true, only_on: [:forms]

  field :start_month, as: :text, hide_on: [:forms]
  field :end_month, as: :text, hide_on: [:forms]
end
