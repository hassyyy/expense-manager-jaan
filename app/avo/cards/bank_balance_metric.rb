include ActionView::Helpers::NumberHelper

class BankBalanceMetric < Avo::Dashboards::MetricCard
  self.id = 'bank_balance_metric'
  self.label = 'Bank Balance'
  self.prefix = '₹'

  query do
    income = Transaction.where(income: true, via: 'Bank').sum(:amount)
    spent = Transaction.where(income: false, via: 'Bank').sum(:amount)

    result number_to_currency(income - spent, AppOptions::CURRENCY_FORMAT.merge(format: "%n"))
  end
end
