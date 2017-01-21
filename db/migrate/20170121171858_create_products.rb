class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.string :name
      t.text :properties
      t.float :price
      t.boolean :available

      t.timestamps
    end
  end
end
