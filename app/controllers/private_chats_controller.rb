class PrivateChatsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_private_chat, only: [:show]

  def index
    if current_user.profile
      @profile = current_user.profile
      @private_chats = PrivateChat.where("profile1_id = ? OR profile2_id = ?", @profile.id, @profile.id).order("created_at DESC")
    else
      redirect_to new_user_password_path, notice: "Please log in first."
    end
  end

  def show
    @profile = Profile.find(params[:profile_id])
    @private_chat = PrivateChat.find(params[:id])
    @message = Message.new
  end

  private

  def find_private_chat
    p params.to_json

    @private_chat = PrivateChat.find(params[:id])
  end

  def private_chat_params
    params.require(:private_chat).permit(:profile1_id, :profile2_id)
  end
end
