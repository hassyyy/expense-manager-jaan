class HomeDashboard < Avo::Dashboards::BaseDashboard
  self.id = "home_dashboard"
  self.name = "Home"
  # self.description = "Tiny dashboard description"
  # self.grid_cols = 3
  # self.visible = -> do
  #   true
  # end

  # cards go here
  card CurrentBalanceMetric
  card AccountBalanceMetric
  card SavingsBalanceMetric
end
