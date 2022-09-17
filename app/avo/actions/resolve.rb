class Resolve < Avo::BaseAction
  self.name = 'Resolve'

  def handle(**args)
    models, fields, current_user, resource = args.values_at(:models, :fields, :current_user, :resource)

    models.each do |model|
      model.update(resolved: true) unless model.resolved
    end
  end
end
