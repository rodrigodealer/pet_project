class Product < ApplicationRecord
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks
  
  validates :name, :price, presence: true
  belongs_to :brand

  serialize :properties, Hash

  mount_uploaders :files, ProductPicturesUploader
end
