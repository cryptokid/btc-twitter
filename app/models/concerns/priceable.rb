module Priceable

  require 'open-uri'
  
  CoinbasePriceApi = URI.parse("https://coinbase.com/api/v1/prices/")

  def get_price(data = "spot_rate")
    url = "#{CoinbasePriceApi}#{data}"
    buffer = open(url).read
    price_hash = JSON.parse(buffer)
    price_hash["amount"]
  end

end