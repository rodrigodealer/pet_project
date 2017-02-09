class Product < ApplicationRecord
  validates :name, :price, presence: true
  belongs_to :brand

  serialize :properties, Hash

  mount_uploaders :files, ProductPicturesUploader
end
