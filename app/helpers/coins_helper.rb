module CoinsHelper
  def format_currency(crypto, rate, mount)    
    initial = mount.to_f/rate.to_f
    mount_today = 0
    case crypto
    when "BTC"
      mount_today = initial * (5.percent_of(10000))
    when "ETH"
      mount_today = initial * ((4.2).percent_of(10000))
    when "ADA"
      mount_today = initial * (1.percent_of(10000))
    else
      nil
    end 
    mount_annual_crypto = mount_today * 12
    mount_annual_usd = mount_annual_crypto * rate.to_f
    return {
      crypto: mount_annual_crypto,
      usd: mount_annual_usd
    }
  end  
end


class Numeric
  def percent_of(n)
    self.to_f / n.to_f * 100.0
  end
end