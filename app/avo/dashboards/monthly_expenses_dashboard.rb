class MonthlyExpensesDashboard < Avo::Dashboards::BaseDashboard
  self.id = "monthly_expenses_dashboard"
  self.name = "Monthly Expenses"

  # cards go here
  card MonthlyExpenses
end
