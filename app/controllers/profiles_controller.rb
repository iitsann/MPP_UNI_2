class ProfilesController < InheritedResources::Base
  before_action :set_profile, only: [:show, :edit, :update, :destroy]

  # GET /profiles/1
  def show
  end

  # GET /profiles/1/edit
  def edit
  end

  # PATCH/PUT /profiles/1
  def update
    @profile = Profile.find(params[:id])
    current_hobby_ids = @profile.hobbies.present? ? @profile.hobbies.split(',').reject(&:empty?).map(&:strip).uniq : []
    selected_hobby_ids = params[:hobby_ids] ? params[:hobby_ids].reject(&:blank?).map(&:strip).uniq : []
    selected_hobby_ids.each do |hobby_id|
      if current_hobby_ids.include?(hobby_id)
        current_hobby_ids.delete(hobby_id)
      else
        current_hobby_ids << hobby_id
      end
    end
    if @profile.update(profile_params.merge(hobbies: current_hobby_ids.join(',')))
      redirect_to @profile, notice: 'Profile was successfully updated.'
    else
      render :edit
    end
  end


  # DELETE /profiles/1
  def destroy
    @profile.destroy
    redirect_to profiles_url, notice: 'Profile was successfully deleted.'
  end

  private

  def set_profile
    @profile = Profile.find(params[:id])
  end

  def profile_params
    params.require(:profile).permit(:login, :email, :gender, :birth_date, :city, :user_id, :avatar, hobby_ids: [])
  end
end
