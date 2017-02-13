class AddDetailFieldsToProduct < ActiveRecord::Migration[5.0]
  def change
    add_column :products, :description, :string
    add_column :products, :weight, :double
    add_column :products, :height, :double
    add_column :products, :width, :double
    add_column :products, :depth, :double
  end
end
