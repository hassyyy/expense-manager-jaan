class SavingResource < Avo::BaseResource
  self.title = :name
  self.includes = []
  self.record_selector = false
  self.after_create_path = :index
  self.after_update_path = :index

  field :name, as: :text, link_to_resource: true, required: true
  field :amount, as: :number, required: true
  field :month, as: :select, options: AppOptions::MONTHS.hashify, default: -> { Date.today.strftime("%b") }
  field :year, as: :number, min: AppOptions::MIN_YEAR, default: -> { Date.today.year }
  field :income, as: :boolean, default: false, hide_on: [:index]
end
