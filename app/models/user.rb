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
    %w[created_at email id id_value remember_created_at reset_password_sent_at reset_password_token_cont reset_password_token_eq reset_password_token_start reset_password_token_end confirmation_token_cont confirmation_token_eq confirmation_token_start confirmation_token_end unconfirmed_email_cont unconfirmed_email_start unconfirmed_email_end unconfirmed_email_eq
       updated_at is_banned country city]
  end

  def self.ransackable_associations(_auth_object=nil)
    %w[posts profile]
  end

  def create_profile
    Profile.create(user: self, email:, city:, country:)
  end
end
