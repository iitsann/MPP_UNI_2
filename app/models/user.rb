class User < ApplicationRecord
  after_create :create_profile
  has_one :profile
  has_many :posts
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
          :confirmable
  validates :email, :password, presence: true
  validates :email, uniqueness: true

  def self.ransackable_attributes(_auth_object=nil)
    %w[created_at email encrypted_password id id_value remember_created_at reset_password_sent_at
       reset_password_token updated_at is_banned country city]
  end

  def create_profile
    Profile.create(user: self, email:, city:, country:)
  end
end
