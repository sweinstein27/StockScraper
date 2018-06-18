class StockScraper::Stock
  attr_accessor :name, :stock_price, :volume, :pe, :url

  def initialize(name = nil, url = nil )
    @name = name
    @url = url
  end

  def self.all
    @@all ||= scrape_stock_movers
  end


# def self.movers
#   #returns all instances of stock from movers scraper
#   stock_1 = self.new
#   stock_1.name = "stockname1"
#   stock_1.stock_price = "$45"
#   stock_1.volume = "55m"
#   stock_1.pe = "15"

def self.scrape_stock_movers
     doc = Nokogiri::HTML(open('http://www.cnbc.com'))
end


end
