class StockScraper::CLI

  def call
    main_menu
  end

def list_stocks

StockScraper::Stock.all

  puts "Most Active Stocks:"

  StockScraper::Stock.all.each_with_index do |stock, i|
    puts "#{i+1}. #{stock.stock_name}"
  end


end

def main_menu
  puts "Stocks:"
  list_stocks
  input = nil
  puts "Please enter a number 1-10 to learn more or type exit"
  input = gets.strip
    if input == "exit"
      bye
    elsif input != "exit"
      if input.to_i.between?(1,10)
        which_stock = StockScraper::Stock.all[input.to_i-1]
        which_stock.save_news
        which_stock.news.each_with_index do |news, i|
          if !news[:headline].nil?
            binding.pry
          puts "#{i+1}. #{news[:headline]}"
        end
      end
    end
  end
puts "Which article would you like to read?"
input = gets.strip
  if input == "exit"
    bye
  elsif input.to_i < which_stock.news.length+1
    puts "article_url"

  else
    puts "Please try again"
  end
call
end


def bye
  return "See you later!"
end

end
