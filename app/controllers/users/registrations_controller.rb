class Users::RegistrationsController < Devise::RegistrationsController
  protected

  def sign_up_params
    params.require(:user).permit(:email, :password, :password_confirmation, :country, :city).tap do |user_params|
      if user_params[:city]
        city = user_params[:city]
        results = Geocoder.search(city)
        user_params[:city] = results.first&.city
        user_params[:country] = results.first&.country
      end
    end
  end

  def after_sign_up_path_for(resource)
    resource.create_profile unless resource.profile
    super
  end
end
