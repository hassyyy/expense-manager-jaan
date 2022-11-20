class MonthlyExpenses < Avo::Dashboards::PartialCard
  self.id = "monthly_expenses"
  self.partial = "avo/cards/monthly_expenses"
  self.display_header = false
  self.rows = 12
  self.cols = 6
end
