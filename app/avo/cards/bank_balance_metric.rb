class BankBalanceMetric < Avo::Dashboards::MetricCard
  self.id = 'bank_balance_metric'
  self.label = 'Bank Balance'
  # self.cols = 1
  # self.rows = 1
  # self.initial_range = 30
  # self.ranges = [7, 30, 60, 365, 'TODAY', 'MTD', 'QTD', 'YTD', 'ALL']
  # self.prefix = '$'
  # self.suffix = '%'
  # self.refresh_every = 10.minutes

  query do
    income = Transaction.where(income: true, via: 'Bank').sum(:amount)
    spent = Transaction.where(income: false, via: 'Bank').sum(:amount)

    result number_to_currency(income - spent, AppOptions::CURRENCY_FORMAT.merge(format: "%n"))
  end
end
