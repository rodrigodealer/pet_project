class GridSerializer
  def self.load(value)
    JSON.load(value)
  end

  def self.dump(value)
    JSON.dump(value)
  end
end

class Product < ApplicationRecord
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks
  index_name([Rails.env,base_class.to_s.pluralize.underscore].join('_'))

  validates :name, :price, presence: true
  belongs_to :brand

  serialize :properties, GridSerializer

  mount_uploaders :files, ProductPicturesUploader
end
