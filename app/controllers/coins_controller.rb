require './app/clients/coin_api_client'

class CoinsController < ApplicationController
  TOKEN = "8165CA3C-9D33-401E-A406-4E541569E785"

  def get_rate(base)
    client = CoinApiClient.new(TOKEN, base, "USD")
    JSON.parse(client.get_rate)
  end
  
  def home
    rates = []
    ["BTC","ETH","ADA"].each do |crypto|
      response = get_rate(crypto)      
      rates.push({
        :crypto => crypto,
        :rate => response["rate"]
      })
    end    
    @rates = rates
  end

  def search
    home
    @mount = params[:query]
    respond_to do |format|
      format.turbo_stream do
        render turbo_stream: turbo_stream.update("rates_container",
        partial: "rates_values",
        locals: {rates: @rates, mount: params[:query]})  
      end
      format.csv
    end       
  end
  
end
