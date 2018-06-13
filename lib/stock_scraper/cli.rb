class StockScraper::CLI

  def call
    puts "Stocks:"
    list_stocks
    menu
    bye
  end

def list_stocks
  puts <<-DOC
Biggest gainers:
1.
2.
3.
4.
5.

Biggest losers:
1.
2.
3.
4.
5.
    DOC
end

def menu
  input = nil
  while input != "exit"
    puts "Please enter a valid stock symbol to learn more or press exit"
    input = gets.strip.downcase
    puts "Stock price: $74"
    puts "Volume: 54m"
    puts "P/E: 15"
  end
end

def bye
  puts "See you later!"
end

end
