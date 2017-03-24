class CreatePlans < ActiveRecord::Migration[5.0]
  def change
    create_table :plans do |t|
      t.references :user
      t.integer :period
      t.integer :value
      t.string :label

      t.timestamps
    end
  end
end
