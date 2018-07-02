class StockScraper::CLI

  def call
    puts "Stocks:"
    list_stocks
    menu
    bye
  end

def list_stocks

StockScraper::Stock.all

  puts <<-DOC
Most Active Stocks:
1.  #{StockScraper::Stock.all[0].stock_name}
2.  #{StockScraper::Stock.all[1].stock_name}
3.  #{StockScraper::Stock.all[2].stock_name}
4.  #{StockScraper::Stock.all[3].stock_name}
5.  #{StockScraper::Stock.all[4].stock_name}
6.  #{StockScraper::Stock.all[5].stock_name}
7.  #{StockScraper::Stock.all[6].stock_name}
8.  #{StockScraper::Stock.all[7].stock_name}
9.  #{StockScraper::Stock.all[8].stock_name}
10. #{StockScraper::Stock.all[9].stock_name}

    DOC

end

def menu
  input = nil
  while input != "exit"
    puts "Please enter a number 1-10 to learn more or type exit"
    input = gets.strip
    if input.to_i.between?(1,10)
      StockScraper::Stock.scrape_individual_stock_news(input)
    end
  end
end

def bye
  puts "See you later!"
end

end
