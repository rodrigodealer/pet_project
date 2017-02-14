module ProductsHelper

  def label_for_properties(properties)
    properties.map {|p| ["#{p.first} - R$ #{p.last}", p.first] }
  end

  def qty_items
    (1..10).map {|i| [i, i]}
  end

  def label_shuffle(tags)
    options = ['default', 'primary', 'success', 'info', 'warning', 'danger']
    tags.map do |tag|
      item = options.sample
      options.delete(item)
      {name: tag, label: item}
    end
  end

  def properties_comma_separated(properties, property)
    properties.first[property].map{|t| t.first }.join(', ')
  end
end
