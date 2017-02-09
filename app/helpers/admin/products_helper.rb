module Admin::ProductsHelper
  def available?(product)
    product.available ? 'Sim' : 'Não'
  end

  def availability_class(product)
    product.available ? 'success' : 'danger'
  end
end
