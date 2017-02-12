class User < ApplicationRecord
  before_save :default_values

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable, :omniauth_providers => [:facebook]

  has_many :addresses

  validates :kind, presence: true, inclusion: { in: ['U', 'A'] }

  devise

  def self.facebook(auth:, email:)
    self.where(provider: auth.provider, uid: auth.uid).first_or_create! do |user|
      byebug
      user.provider = auth.provider
      user.uid = auth.uid
      user.email = email
      user.name = auth.info.name
      user.password = Devise.friendly_token[0,20]
    end
  end

  def default_values
    self.kind ||= 'U'
  end
end
