class Product < ApplicationRecord
  validates :name, :price, :available, presence: true
  belongs_to :brand

  serialize :properties, Hash
end
