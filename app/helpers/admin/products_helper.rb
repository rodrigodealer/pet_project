module Admin::ProductsHelper
  def available?(product)
    product.available ? 'Sim' : 'Não'
  end
end
