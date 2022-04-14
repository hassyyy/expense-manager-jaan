class CurrentBalanceMetric < Avo::Dashboards::MetricCard
  self.id = 'current_balance_metric'
  self.label = 'Current Balance'
  # self.cols = 1
  # self.rows = 1
  # self.initial_range = 30
  # self.ranges = [7, 30, 60, 365, 'TODAY', 'MTD', 'QTD', 'YTD', 'ALL']
  # self.prefix = '$'
  # self.suffix = '%'
  # self.refresh_every = 10.minutes

  query do
    income = Expense.where(income: true).sum(:amount)
    expenses = Expense.where(income: false).sum(:amount)

    result (income - expenses)
  end
end
