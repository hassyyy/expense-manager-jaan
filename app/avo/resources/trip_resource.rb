class TripResource < Avo::BaseResource
  self.title = :name
  self.includes = []
  self.record_selector = false
  self.after_create_path = :index
  self.after_update_path = :index

  field :location, as: :text, link_to_resource: true, required: true
  field :with, as: :text, required: true
  field :month, as: :select, options: AppOptions::MONTHS.hashify, default: -> { Date.today.strftime("%b") }
  field :year, as: :number, min: AppOptions::MIN_YEAR, default: -> { Date.today.year }
  field :amount, as: :number, required: true  
  field :notes, as: :trix, always_show: true
end
