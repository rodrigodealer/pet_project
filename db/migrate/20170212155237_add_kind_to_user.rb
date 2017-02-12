class AddKindToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :kind, :string, default: 'U'
  end
end
