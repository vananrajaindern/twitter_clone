class AddUserReferenceToLikes < ActiveRecord::Migration[5.1]
  def change
    add_reference :likes, :user, foreign_key: true, null: false
  end
end
