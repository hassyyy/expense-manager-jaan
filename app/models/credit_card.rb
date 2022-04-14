class CreditCard < ApplicationRecord
  has_many :transactions
  has_many :loans
  default_scope { order(created_at: :asc) }
end
