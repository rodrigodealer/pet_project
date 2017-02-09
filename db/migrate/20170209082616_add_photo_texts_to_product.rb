class AddPhotoTextsToProduct < ActiveRecord::Migration[5.0]
  def change
    add_column :products, :files, :text
  end
end
