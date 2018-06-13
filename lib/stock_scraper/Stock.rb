class StockScraper::Stock

def self.movers
  attr_accessor :name, :stock_price, :volume, :pe
  #returns all instances of stock from movers scraper
  stock_1 = self.new
  stock_1.name = "stockname1"
  stock_1.stock_price = "$45"
  stock_1.volume = "55m"
  stock_1.pe = "15"

end

end
