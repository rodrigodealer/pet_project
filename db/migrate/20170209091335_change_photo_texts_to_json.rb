class ChangePhotoTextsToJson < ActiveRecord::Migration[5.0]
  def change
    change_column :products, :files, :json
  end
end
