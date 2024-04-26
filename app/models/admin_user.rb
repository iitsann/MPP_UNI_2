class AdminUser < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable,
         :recoverable, :rememberable, :validatable

  validate :email_domain

  def self.ransackable_attributes(_auth_object=nil)
    %w[created_at email encrypted_password id id_value remember_created_at reset_password_sent_at
       reset_password_token updated_at]
  end

  private

  def email_domain
    return if email.blank?

    domain = email.split("@").last
    errors.add(:email, "must be from karazin.ua") unless domain == "karazin.ua"
  end
end
