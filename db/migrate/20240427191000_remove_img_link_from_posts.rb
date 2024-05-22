class RemoveImgLinkFromPosts < ActiveRecord::Migration[7.1]
  def change
    remove_column :posts, :img_link, :string
  end
end
