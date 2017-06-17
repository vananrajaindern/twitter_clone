class CreateTweetTags < ActiveRecord::Migration[5.1]
  def change
    create_join_table :tweets, :tags do |t|
      t.references :tweet, null: false, foreign_key: true
      t.references :tag, null: false, foreign_key: true

      t.timestamps
    end
  end
end
