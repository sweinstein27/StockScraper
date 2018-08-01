class StockScraper::CLI

  def call
    list_stocks
    choose_stock
    choose_article
  end


def choose_stock
  puts "Please enter a number 1-10 to learn more or type exit"
  input = gets.strip
  if input == "exit"
    bye
  elsif input.to_i.between?(1,10)
    @which_stock = StockScraper::Stock.all[input.to_i-1]
    @which_stock.save_news
    @which_stock.news.each_with_index do |news, i|
      puts "#{i+1}. #{news[:headline]}" unless news == nil
    end
  end
  else
    puts "Try Again"
    hoose_stock
  end
end


def choose_article
puts "Which article would you like to read?"
input = gets.strip
  if input == "exit"
    bye
  elsif input.to_i < @which_stock.news.length+1
    puts @which_stock.news[input.to_i-1][:news_url]
  else
    puts "Please try again"
  end
end

def bye
  return "See you later!"
end

def list_stocks
  puts "Stocks:"
  StockScraper::Stock.all
  puts "Most Active Stocks:"
  StockScraper::Stock.all.each_with_index do |stock, i|
    puts "#{i+1}. #{stock.stock_name}"
  end
end

end
