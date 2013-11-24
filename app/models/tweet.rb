class Tweet < ActiveRecord::Base
  validates_uniqueness_of :body
end
