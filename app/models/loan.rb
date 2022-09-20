class Loan < ApplicationRecord
  belongs_to :credit_card

  def start_month
    start_date.strftime("%B %Y")
  end

  def end_month
    (start_date.prev_month + tenure.months).strftime("%B %Y")
  end
end
