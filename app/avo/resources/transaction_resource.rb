class TransactionResource < Avo::BaseResource
  self.title = :name
  self.includes = []
  self.after_create_path = :index
  self.after_update_path = :index

  field :name, as: :text, link_to_resource: true, required: true
  field :amount, as: :number, required: true
  field :month, as: :select, options: AppOptions::MONTHS.hashify, default: -> { Date.today.strftime("%b") }, only_on: [:forms]
  field :year, as: :number, min: AppOptions::MIN_YEAR, default: -> { Date.today.year }, only_on: [:forms]
  field :month, as: :text do |model, resource, view|
    "#{model.month} #{model.year}"
  end
  field :via, as: :badge, options: { info: 'Bank', success: 'Cash' }
  field :via, as: :select, only_on: :forms, options: { 'Cash': :Cash, 'Bank': :Bank }, default: 'Cash'
  field :income, as: :boolean, default: false, hide_on: [:index]

  # filter ViaFilter
end
