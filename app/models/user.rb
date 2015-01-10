class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  mount_uploader :profile_photo, ProfilePhotoUploader

  has_many :groups
  has_many :posts, dependent: :destroy
  has_many :photos, dependent: :destroy
  
  # validates :sname,
  # presence: true,
  # uniqueness: true,
  # length: { maximum: 50 }

  validates :email,
  uniqueness: true
  validates :sname,
  uniqueness: true

end
