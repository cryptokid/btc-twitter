class Tweet < ActiveRecord::Base
  validates_uniqueness_of :body

  extend Priceable

  def self.average_sentiment
    sentiments = Tweet.average('sentiment')
  end

end
