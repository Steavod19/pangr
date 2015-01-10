class Group < ActiveRecord::Base
  belongs_to :user
  has_many :posts, dependent: :destroy
  has_many :photos, dependent: :destroy


  validates :title,
  presence: true,
  length: { maximum: 50 }
  validates :description,
  length: { maximum: 300 }
end
