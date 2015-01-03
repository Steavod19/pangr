class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :groups
  has_many :posts

  validates :sname,
  presence: true,
  uniqueness: true,
  length: { maximum: 50 }

  validates :email,
  uniqueness: true


end
