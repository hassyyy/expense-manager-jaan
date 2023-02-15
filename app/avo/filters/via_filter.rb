class ViaFilter < Avo::Filters::SelectFilter
  self.name = 'Via'

  def apply(request, query, value)
    query.where(via: value)
  end

  def options
    ['Cash', 'Bank'].hashify
  end

  def default
    'Cash'
  end
end
