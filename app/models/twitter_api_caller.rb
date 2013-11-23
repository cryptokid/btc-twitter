class TwitterAPICaller

  def self.results(response)
    if response.code == '200'
      tweets = JSON.parse(response.body)
      # let's start with tweets and filter down from there
    end
  end

  # "q" => "bitcoin", "count" => 10
  def self.call(type = 'search/tweets', query_hash)
    consumer_key = OAuth::Consumer.new(
        BTC_TWEETS_CONS_KEY,
        BTC_TWEETS_CONS_SECRET)
    access_token = OAuth::Token.new(
        BTC_TWEETS_OAUTH_TOKEN,
        BTC_TWEETS_OAUTH_TOKEN_SECRET)

    # All requests will be sent to this server.
    base_url = "https://api.twitter.com"
    path = "/1.1/#{type}.json?"
    query = URI.encode_www_form(query_hash)
    address = URI("#{base_url}#{path}#{query}")

    # Set up Net::HTTP to use SSL, which is required by Twitter.
    http = Net::HTTP.new address.host, address.port
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_PEER

    # Build the request and authorize it with OAuth.
    request = Net::HTTP::Get.new address.request_uri
    request.oauth! http, consumer_key, access_token

    # Issue the request and return the response.
    http.start
    http.request request
  end
end