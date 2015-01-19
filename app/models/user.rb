class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  mount_uploader :profile_photo, ProfilePhotoUploader

  has_many :posts, dependent: :destroy
  has_many :photos, dependent: :destroy

  has_many :managed_groups, class_name: "Group", foreign_key: :owner_id
  has_many :members
  has_many :groups, through: :members



  validates :email,
  presence: true,
  uniqueness: true
  validates :sname,
  presence: true,
  uniqueness: true

  def latest_posts(count)
    posts.order(created_at: :desc).limit(count)
  end
  def self.random(count)
    order("RANDOM()").limit(count)
  end

end
