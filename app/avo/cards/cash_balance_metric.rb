class CashBalanceMetric < Avo::Dashboards::MetricCard
  self.id = 'cash_balance_metric'
  self.label = 'Cash Balance'
  self.prefix = '₹'

  query do
    income = Transaction.where(income: true, via: 'Cash').sum(:amount)
    spent = Transaction.where(income: false, via: 'Cash').sum(:amount)

    result number_to_currency(income - spent, AppOptions::CURRENCY_FORMAT.merge(format: "%n"))
  end
end
