class Product < ApplicationRecord
  validates :name, :price, presence: true
  belongs_to :brand

  serialize :properties, Hash
end
