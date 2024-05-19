class ChatCreationService
  def self.create_chat(current_user, selected_profile_id)
    selected_profile = Profile.find(selected_profile_id)
    profile1_id = current_user.profile.id
    profile2_id = selected_profile.id

    return {profile: current_user.profile, alert: "You cannot send a message to yourself."} if current_user.profile == selected_profile

    private_chat = PrivateChat.get_private_chat(profile1_id, profile2_id)
    private_chat ||= PrivateChat.create(profile1: current_user.profile, profile2: selected_profile)

    {profile: current_user.profile, private_chat:, alert: nil}
  end
end
