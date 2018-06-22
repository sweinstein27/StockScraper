class StockScraper::Stock

  attr_accessor :stock_name, :stock_price, :volume, :pe, :url, :stock_symbol

  def initialize(name = nil, url = nil )
    @name = name
    @url = url
  end

  def self.all
    @@all ||= scrape_stock_movers_top
  end


# def self.movers
#   #returns all instances of stock from movers scraper
#   stock_1 = self.new
#   stock_1.name = "stockname1"
#   stock_1.stock_price = "$45"
#   stock_1.volume = "55m"
#   stock_1.pe = "15"
# end


def self.scrape_stock_movers_top
     doc = Nokogiri::HTML(open('https://money.cnn.com/data/us_markets/'))
     stocks = []
     doc.css("td").each do |row|
       stock_symbol = row.css(".wsod_symbol").children.text
       stock_name = row.css("span").text
       url = row.css(".wsod_symbol").attribute("href").value
        stocks << {stock_symbol: stock_symbol, stock_name: stock_name, url: url  }
     end
   end



end
