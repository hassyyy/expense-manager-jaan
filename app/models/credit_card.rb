class CreditCard < ApplicationRecord
  has_many :transactions
  has_many :loans
  default_scope { order(created_at: :asc) }

  def current_month
    (Date.today.day <= billing_day) ? Date.today : Date.today.next_month
  end

  def previous_month
    (Date.today.day <= billing_day) ? Date.today.last_month : Date.today
  end
end
