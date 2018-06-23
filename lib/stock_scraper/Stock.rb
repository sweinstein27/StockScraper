class StockScraper::Stock

  attr_accessor :stock_name, :stock_price, :volume, :pe, :url, :stock_symbol

  @@all = []


  def initialize(stock_name = nil, stock_symbol = nil,  url = nil )
    @stock_name = stock_name
    @url = url
    @stock_symbol = stock_symbol
    @@all << self
  end

  def self.all
  if @@all.empty?
    scrape_stock_movers
  else
    @@all
  end
  end


# def self.movers
#   #returns all instances of stock from movers scraper
#   stock_1 = self.new
#   stock_1.name = "stockname1"
#   stock_1.stock_price = "$45"
#   stock_1.volume = "55m"
#   stock_1.pe = "15"
# end


def self.scrape_stock_movers
     doc = Nokogiri::HTML(open('https://money.cnn.com/data/us_markets/'))
     stocks = []
     doc.css("#wsod_whatsMoving").css("td.wsod_firstCol").each do |row|
       stock_symbol = row.css(".wsod_symbol").children.text
       stock_name = row.css("span").text
       url = row.css(".wsod_symbol").attribute("href").value
       self.new(stock_name, stock_symbol, url)
        # @@all << {stock_symbol: stock_symbol, stock_name: stock_name, url: url  }
        #initialize a hash, create new instance
      end
   end

def self.scrape_individual_stock

end


end
