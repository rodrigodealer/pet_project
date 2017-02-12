class CreateAddresses < ActiveRecord::Migration[5.0]
  def change
    create_table :addresses do |t|
      t.string :label
      t.string :street
      t.string :number
      t.string :other
      t.string :neighborhood
      t.string :zip
      t.string :type

      t.timestamps
    end
  end
end
