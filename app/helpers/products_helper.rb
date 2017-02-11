module ProductsHelper

  def label_for_properties(properties)
    properties.map {|p| ["#{p.first} - R$ #{p.last}", p.first] }
  end

  def qty_items
    (1..10).map {|i| [i, i]}
  end
end
