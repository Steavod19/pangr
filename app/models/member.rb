class Member < ActiveRecord::Base
  belongs_to :user
  belongs_to :group


  validates :user,
  presence: true
  validates :group,
  presence: true

end
