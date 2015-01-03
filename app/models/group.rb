class Group < ActiveRecord::Base
  belongs_to :user
  has_many :posts

  validates :title,
  presence: true,
  length: { maximum: 50 }
  validates :description,
  length: { maximum: 170 }
end
