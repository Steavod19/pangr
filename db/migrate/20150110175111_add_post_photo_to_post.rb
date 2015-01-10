class AddPostPhotoToPost < ActiveRecord::Migration
  def change
    add_column :posts, :post_photo, :string
  end
end
