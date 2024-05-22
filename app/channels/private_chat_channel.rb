class PrivateChatChannel < ApplicationCable::Channel
  def subscribed
    @private_chat = PrivateChat.find(params[:id]) if params[:id].present?

    stream_for @private_chat
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
