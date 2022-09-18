class Expensify < Avo::BaseAction
  self.name = 'Expensify'

  def handle(**args)
    models, fields, current_user, resource = args.values_at(:models, :fields, :current_user, :resource)

    models.each do |model|
      expense = Expense.new
      expense.name = model.name
      expense.amount = model.amount
      expense.month = Date.today.strftime("%b")
      expense.year = Date.today.year
      expense.save

      model.update(resolved: true) unless model.resolved
    end
  end
end
