class Loan < ApplicationRecord
  belongs_to :credit_card
  default_scope { order(created_at: :asc) }
end
