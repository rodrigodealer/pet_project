class Order < ApplicationRecord
  belongs_to :user
  belongs_to :plan
  belongs_to :shipping_address, class_name: 'Address'
  belongs_to :billing_address, class_name: 'Address'

  validates :items, :user_id, :plan_id, :shipping_address, :billing_address, presence: true
end
