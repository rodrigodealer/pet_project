class User < ApplicationRecord
  before_save :default_values

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :addresses

  validates :kind, presence: true, inclusion: { in: ['U', 'A'] }


  def default_values
    self.kind ||= 'U'
  end
end
