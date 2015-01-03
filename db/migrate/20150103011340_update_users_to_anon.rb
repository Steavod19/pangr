class UpdateUsersToAnon < ActiveRecord::Migration
  def change
    User.update_all(sname: "Anonymous")
  end
end
