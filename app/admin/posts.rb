# frozen_string_literal: true

ActiveAdmin.register Post do
  permit_params :img_link, :title, :body, :replies, :likes, :dislikes, :topic_id, :is_hidden

  actions :all

  member_action :hide, method: :put do
    resource.update(is_hidden: true)
    redirect_to resource_path, notice: "Post has been hidden"
  end

  member_action :open, method: :put do
    resource.update(is_hidden: false)
    redirect_to resource_path, notice: "Post has been opened"
  end

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
    column :is_hidden
    actions defaults: true do |post|
      if post.is_hidden
        link_to "Open", open_admin_post_path(post), method: :put
      else
        link_to "Hide", hide_admin_post_path(post), method: :put
      end
    end
  end
end
