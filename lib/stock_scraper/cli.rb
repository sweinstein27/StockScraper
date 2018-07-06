class StockScraper::CLI

  def call
    puts "Stocks:"
    list_stocks
    menu
    bye
  end

def list_stocks

StockScraper::Stock.all

  puts "Most Active Stocks:"

  StockScraper::Stock.all.each_with_index do |stock, i|
    puts "#{i+1}. #{stock.stock_name}"
  end


end

def menu
  input = nil
  while input != "exit"
    puts "Please enter a number 1-10 to learn more or type exit"
    input = gets.strip
    if input.to_i.between?(1,10)
      which_stock = StockScraper::Stock.all[input.to_i-1]
      which_stock.save_news
      which_stock.news.each_with_index do |article, i|
        if !article.nil?
          puts "#{i+1}. #{article}
          "
        end
      end
    end
  end
end


def bye
  puts "See you later!"
end

end
