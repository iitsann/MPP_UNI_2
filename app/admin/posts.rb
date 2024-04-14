ActiveAdmin.register Post do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :img_link, :title, :body, :replies, :likes, :dislikes, :topic_id

  actions :all

  index do
    selectable_column
    column :id
    column :img_link
    column :title
    column :body
    column :replies
    column :likes
    column :dislikes
    column :topic_id
    column :created_at
    column :updated_at
    actions defaults: true do |foo|
      p foo
      link_to "Hide", "/my/path"
    end
  end
  #
  # or
  #
  # permit_params do
  #   permitted = [:img_link, :title, :body, :replies, :likes, :dislikes, :topic_id]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

end
