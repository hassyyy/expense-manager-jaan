class Transaction < ApplicationRecord
  default_scope { order(updated_at: :desc) }

  validates :via, presence: true,
                     inclusion: { in: ['Cash', 'Bank'] }
end
