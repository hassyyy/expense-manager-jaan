class MonthlyTransactions < Avo::Dashboards::PartialCard
  self.id = "monthly_transactions"
  self.partial = "avo/cards/monthly_transactions"
  self.display_header = false
  self.rows = 12
  self.cols = 6
end
