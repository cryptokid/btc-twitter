class Tweet < ActiveRecord::Base
  validates_uniqueness_of :body

  extend Priceable

  def self.average_sentiment
    Tweet.order(:created_at => :desc).limit(100).average(:sentiment)
  end

end
