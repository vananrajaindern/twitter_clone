class CreateFollowJoinTable < ActiveRecord::Migration[5.1]
  def change
    create_table :followings do |t|
      t.references :follower, null: false, foreign_key: { to_table: :users }
      t.references :followee, null: false, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
