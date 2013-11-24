class AddSentimentToTweets < ActiveRecord::Migration
  def change
    add_column :tweets, :sentiment, :integer
  end
end
