class AccountBalanceMetric < Avo::Dashboards::MetricCard
  self.id = 'account_balance_metric'
  self.label = 'Account Balance'
  # self.cols = 1
  # self.rows = 1
  # self.initial_range = 30
  # self.ranges = [7, 30, 60, 365, 'TODAY', 'MTD', 'QTD', 'YTD', 'ALL']
  # self.prefix = '$'
  # self.suffix = '%'
  # self.refresh_every = 10.minutes

  query do
    balance = Balance.sum(:amount)
    credit_card_balances = CreditCard.sum do |card|
      date = (Date.today.day <= card.billing_day) ? Date.today : Date.today.next_month
      card.transactions.where(month: date.strftime("%b"), year: date.year).sum(:amount)
    end

    result (balance - credit_card_balances)
  end
end
