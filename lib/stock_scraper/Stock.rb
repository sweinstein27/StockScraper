class StockScraper::Stock

  attr_accessor :name, :stock_price, :volume, :pe, :url

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
     doc.css("tr").each do |row|
       binding.pry
       row.css("td")
        #  symbol = stock.css(".symbol")
        #  link = "#{stock.attr('href')}"
        #  name =
        #  percent_change =
     end
   end

# def self.scrape_stock_movers
#      doc = Nokogiri::HTML(open('https://www.cnbc.com'))
#      doc.css('market-movers')
# end








  # def self.movers
  #   attr_accessor :name, :stock_price, :volume, :pe
  #   #returns all instances of stock from movers scraper
  #   stock_1 = self.new
  #   stock_1.name = "stockname1"
  #   stock_1.stock_price = "$45"
  #   stock_1.volume = "55m"
  #   stock_1.pe = "15"
  # end

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
