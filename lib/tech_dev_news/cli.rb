class TechDevNews::CLI

  def initialize
    clear_screen
    puts ""
    puts "loading initial setup..."
    puts ""
    @news_articles = TechDevNewsScraper.new.scrape
  end

  def call
    greetings
    list_news
    menu
  end

  private

    def clear_screen
      puts "\e[H\e[2J"
    end

    def greetings
      clear_screen
      puts "***********************************"
      puts "Welcome to Tech Developer News CLI"
      puts "***********************************"
      puts ""

    end 

    def list_news
      puts "Here are today's list of Tech Developer News"
      @news_articles.each.with_index(1) do |article, i|
        puts "#{i}. #{article}"
      end
    end

    def menu
      choice = nil

      while choice != "exit"
        puts ""
        puts "***Menu***"
        puts "list - see the list again"
        puts "1 ~ #{@news_articles.size} - see more details about a specific news"
        puts "exit - exit the app"

        choice = gets.strip.downcase
        clear_screen

        if choice.to_i > 0 && choice.to_i <= @news_articles.size
          puts "#{@news_articles[choice.to_i - 1]}'s detail goes here"
        elsif choice == "list"
          list_news
        elsif choice == 'exit'
          goodbye          
        else
          puts "'#{choice}' is not a valid selection.  Please try again."
        end
      end
    end

    def goodbye
      puts "Thank you for using this app.  See you next time!"
    end
end
