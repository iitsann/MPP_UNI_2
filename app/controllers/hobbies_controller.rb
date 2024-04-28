class HobbiesController < InheritedResources::Base

  private

    def hobby_params
      params.require(:hobby).permit(:name, :profile_ids)
    end

end
