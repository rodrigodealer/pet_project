class Product < ApplicationRecord
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks
  index_name([Rails.env,base_class.to_s.pluralize.underscore].join('_'))
  
  validates :name, :price, presence: true
  belongs_to :brand

  serialize :properties, Hash

  mount_uploaders :files, ProductPicturesUploader
end
