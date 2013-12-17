class TweetsController < ApplicationController

  # TODO: stop rendering the entire database of BTC tweets, it's slowing things down big time!
  
  def bitcoin
    prices = {}
    prices['sell'] = Tweet.get_price("sell")
    prices['buy'] = Tweet.get_price("buy")
    # update the data for that partial
    # re-render the partial
    render :json => prices.to_json
  end

  def twitter
    # hard-code the search term for now...
    query_hash = { "q" => "bitcoin", "count" => 100 }
    response = TwitterAPICaller.call(query_hash)
    tweets = TwitterAPICaller.results(response).map do |t|
      Tweet.create(t)
    end#.select &:valid?

    respond_to do |format|
      format.html { redirect_to tweets_path }
      format.json { render :json => tweets }
    end
    
  end

  def index
    @tweets = Tweet.order(:tweeted_at => :desc)
    @average_sentiment = Tweet.average_sentiment
    @bid, @offer, @spot = Tweet.get_price("sell"), Tweet.get_price("buy"), Tweet.get_price
  end

end
