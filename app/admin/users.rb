ActiveAdmin.register User do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :email, :encrypted_password, :reset_password_token, :reset_password_sent_at, :remember_created_at

  actions :all

  member_action :ban, method: :put do
    resource.update_column("is_banned", true)
    redirect_to resource_path, notice: "User has been banned"
  end

  member_action :unban, method: :put do
    resource.update_column("is_banned", false)
    redirect_to resource_path, notice: "User has been unbanned"
  end

  index do
    selectable_column
    column :id
    column :email
    column :reset_password_token
    column :reset_password_sent_at
    column :remember_created_at
    column :created_at
    column :updated_at
    column :is_banned
    actions defaults: true do |user|
      if user.is_banned
        link_to 'Unban', unban_admin_user_path(user), method: :put
      else
        link_to 'Ban', ban_admin_user_path(user), method: :put
      end
    end
  end

  # or
  #
  # permit_params do
  #   permitted = [:email, :encrypted_password, :reset_password_token, :reset_password_sent_at, :remember_created_at]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

end
