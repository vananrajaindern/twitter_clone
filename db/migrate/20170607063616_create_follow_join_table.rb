class CreateFollowJoinTable < ActiveRecord::Migration[5.1]
  def change
    create_table :follows do |t|
      t.bigint :follower_id, :null => false
      t.bigint :following_id, :null => false

      t.timestamps
    end

    add_index :follows, :following_id
    add_index :follows, :follower_id
    add_index :follows, [:following_id, :follower_id], unique: true
  end
end
