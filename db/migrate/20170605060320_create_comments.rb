class CreateComments < ActiveRecord::Migration[5.1]
  def change
    create_table :comments do |t|
      t.references :tweet, foreign_key: true
      t.references :user, foreign_key: true
      t.string :text

      t.timestamps
    end
  end
end
