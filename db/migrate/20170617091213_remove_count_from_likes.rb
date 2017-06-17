class RemoveCountFromLikes < ActiveRecord::Migration[5.1]
  def change
    remove_column :likes, :count, :integer
  end
end
