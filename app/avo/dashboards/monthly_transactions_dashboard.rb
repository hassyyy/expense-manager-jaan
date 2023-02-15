class MonthlyTransactionsDashboard < Avo::Dashboards::BaseDashboard
  self.id = "monthly_transactions_dashboard"
  self.name = "Monthly Transactions"

  # cards go here
  card MonthlyTransactions
end
