class Plan < ApplicationRecord
  belongs_to :user

  validates :period, :label, presence: true

  def days
    case period
    when 'W'
      7
    when 'CW'
      15
    when 'M'
      30
    when 'FFD'
      45
    when 'CM'
      60
    when 'TM'
      90
    else
      nil
    end
  end
end
