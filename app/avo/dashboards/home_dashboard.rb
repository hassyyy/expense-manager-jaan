class HomeDashboard < Avo::Dashboards::BaseDashboard
  self.id = "home_dashboard"
  self.name = "Home"

  # cards go here
  card CashBalanceMetric
  card BankBalanceMetric
end
