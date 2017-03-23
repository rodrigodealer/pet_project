class AddUserAndCityToAddress < ActiveRecord::Migration[5.0]
  def change
    add_column :addresses, :city, :string
    add_column :addresses, :state, :string
  end
end
