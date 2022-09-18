class Loan < ApplicationRecord
  belongs_to :credit_card
  default_scope { order(created_at: :asc) }

  def start_month
    start_date.strftime("%B %Y")
  end

  def end_month
    (start_date.prev_month + tenure.months).strftime("%B %Y")
  end
end
