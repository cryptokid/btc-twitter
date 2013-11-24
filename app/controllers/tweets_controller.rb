class TweetsController < ApplicationController
  
  def new
  end

  def create
    query_hash = { "q" => params[:search], "count" => 100 }
    response = TwitterAPICaller.call(query_hash)
    TwitterAPICaller.results(response).each do |t|
      Tweet.create(
        :user      => t[:user],
        :body      => t[:body],
        :sentiment => t[:sentiment], 
        :source    => t[:source]
      )
    end
    redirect_to tweets_path
  end

  def index
    @tweets = Tweet.all
  end

end
