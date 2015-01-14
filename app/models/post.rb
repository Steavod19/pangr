class Post < ActiveRecord::Base
  belongs_to :group
  belongs_to :user

  mount_uploader :post_photo, PostPhotoUploader

  validates :body, presence: true

  def self.random(count)
    order("RANDOM()").limit(count)
  end
end
