class AddPetsToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :pets, :text
  end
end
