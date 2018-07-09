class StockScraper::Stock

  attr_accessor :stock_name, :url, :stock_symbol, :news, :news_url

  @@all = []


  def initialize(stock_name = nil, stock_symbol = nil,  url = nil)
    @stock_name = stock_name
    @url = url
    @stock_symbol = stock_symbol
    @@all << self
    @news = news

  end

  def self.all
  if @@all.empty?
    StockScraper::Stock.save_stock
  else
    @@all
  end
  end

  def self.save_stock
      StockScraper::Scraper.scrape_stock_movers.each do |stock|
      self.new(stock[:stock_name], stock[:stock_symbol], stock[:url])
    end
  end

  def save_news
    @news = StockScraper::Scraper.scrape_individual_stock_news(self)
  end



end
