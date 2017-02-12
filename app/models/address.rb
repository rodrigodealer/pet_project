class Address < ApplicationRecord
  validates :label, :street, :number, :neighborhood, :zip, presence: true
  validates :kind, presence: true, inclusion: { in: ['S', 'B'] }

  belongs_to :user
end
