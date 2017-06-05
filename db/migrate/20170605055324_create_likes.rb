class CreateLikes < ActiveRecord::Migration[5.1]
  def change
    create_table :likes do |t|
      t.references :tweet, foreign_key: true
      t.integer :count

      t.timestamps
    end
  end
end


