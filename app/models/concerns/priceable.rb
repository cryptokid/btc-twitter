module Priceable
  
  CoinbasePriceApi = "https://coinbase.com/api/v1/prices/"

  def get_price(data = "spot_price")
    url = "#{CoinbasePriceApi}#{data}"
    open(url)
    binding.pry
  end

end