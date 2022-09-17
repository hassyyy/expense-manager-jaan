class Resolve < Avo::BaseAction
  self.name = 'Resolve'

  def handle(**args)
    models, fields, current_user, resource = args.values_at(:models, :fields, :current_user, :resource)

    models.each do |model|
      # Do something with your models.
      model.update resolved: true
    end
  end
end
