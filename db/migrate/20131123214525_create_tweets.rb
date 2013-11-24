class CreateTweets < ActiveRecord::Migration
  def change
    create_table :tweets do |t|
      t.string :user
      t.string :body
      t.string :source
      t.timestamps
    end
  end
end
