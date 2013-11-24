class Tweet < ActiveRecord::Base
  validates_uniqueness_of :body

  extend Priceable

  def self.average_sentiment
    tweets = Tweet.all
    tweets.inject{ |sum, elem| sum + elem }.to_f / tweets.size
  end

end
