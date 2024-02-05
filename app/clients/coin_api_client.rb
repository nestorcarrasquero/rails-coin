require 'rest-client'

class CoinApiClient
  BASE_URI = "https://rest.coinapi.io/v1/exchangerate/"

  def initialize(token, base, currency)
    @token = token
    @base = base
    @currency = currency
  end

  def get_rate
    url = BASE_URI + @base + "/" + @currency
    RestClient.get(
      url,
      { 'Authorization': @token }
    )
  end
end