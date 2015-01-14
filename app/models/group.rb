class Group < ActiveRecord::Base
  belongs_to :owner, class_name: "User"
  has_many :posts, dependent: :destroy

  has_many :members
  has_many :users, through: :members



  validates :title,
  presence: true,
  length: { maximum: 50 }
  validates :description,
  presence: true,
  length: { maximum: 300 }

  def latest_posts(count)
    posts.order(created_at: :desc).limit(count)
  end

  def self.random(count)
    order("RANDOM()").limit(count)
  end
end
