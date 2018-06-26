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


def self.scrape_stock_movers
     doc = Nokogiri::HTML(open('https://money.cnn.com/data/us_markets/'))
     stocks = []
     doc.css("#wsod_whatsMoving").css("td.wsod_firstCol").each do |row|
       stock_symbol = row.css(".wsod_symbol").children.text
       stock_name = row.css("span").text
       url = row.css(".wsod_symbol").attribute("href").value
       self.new(stock_name, stock_symbol, url)
      end
   end

def self.scrape_individual_stock_news(input)
  doc =  Nokogiri::HTML(open("https://money.cnn.com"+@@all[input.to_i-1].url))
  doc.css(".wsod_newsTable").children.children.each do |article|
  news = article.text
  puts news
  #instantiate news and put out each stocks news when called and format
  end
end


end
