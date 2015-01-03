class ChangeColoumnMemberToUser < ActiveRecord::Migration
  def change
    rename_column :posts, :members_id, :user_id
    add_column :posts, :group_id, :integer
  end
end
