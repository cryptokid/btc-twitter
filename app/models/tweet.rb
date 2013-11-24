class Tweet < ActiveRecord::Base
  validates_uniqueness_of :body

  extend Priceable

  def self.average_sentiment
    sentiments = Tweet.all.map &:sentiment
    sentiments.inject{ |sum, elem| sum + elem }.to_f / sentiments.size
  end

end
