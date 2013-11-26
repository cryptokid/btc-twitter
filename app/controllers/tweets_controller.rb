class TweetsController < ApplicationController
  
  def new
  end

  def tweets
  end

  def bitcoin
    prices = {}
    prices['sell'] = Tweet.get_price("sell")
    prices['buy'] = Tweet.get_price("buy")
    # update the data for that partial
    # re-render the partial
    render :json => prices.to_json
  end

  def create
    query_hash = { "q" => params[:search], "count" => 100 }
    response = TwitterAPICaller.call(query_hash)
    TwitterAPICaller.results(response).each do |t|
      Tweet.create(t)
    end
    redirect_to tweets_path
  end

  def index
    @tweets = Tweet.all
    @average_sentiment = Tweet.average_sentiment
    @bid, @offer, @spot = Tweet.get_price("sell"), Tweet.get_price("buy"), Tweet.get_price
  end

end
