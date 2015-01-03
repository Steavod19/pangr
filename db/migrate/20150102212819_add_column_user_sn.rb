class AddColumnUserSn < ActiveRecord::Migration
  def change
    add_column :users, :sname, :string
  end
end
