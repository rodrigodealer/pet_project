class Plan < ApplicationRecord
  belongs_to :user

  validates :period, :value, :label, presence: true
end
