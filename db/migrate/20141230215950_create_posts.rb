class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.text :body, null: false
      t.integer :members_id, null: false

      t.timestamps
    end
  end
end
