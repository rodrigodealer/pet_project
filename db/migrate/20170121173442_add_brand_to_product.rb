class AddBrandToProduct < ActiveRecord::Migration[5.0]
  def change
    add_reference :products, :brand, index: true, foreign_key: true
  end
end
