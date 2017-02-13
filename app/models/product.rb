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

  serialize :tags, GridSerializer

  serialize :properties, GridSerializer

  mount_uploaders :files, ProductPicturesUploader

  def price_for(property, item)
    result = properties.map do |ps|
      ps[property].map { |p| p.last if p.first == item }
    end
    result.flatten.fetch(0)
  end

  def property_titles
    properties.map { |ps| ps.keys }.flatten
  end

  def items_for(property)
    properties.map { |ps| ps[property] }.fetch(0)
  end

  def final_price(size:, color:, type:)
    [price_for(size.first, size.last),
      price_for(color.first, color.last),
      price_for(type.first, type.last)
    ].max
  end
end
