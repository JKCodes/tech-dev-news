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
        puts "#{i}. #{article.to_s}"
      end
    end

    def menu
      choice = nil

      while choice != "exit"
        puts ""
        puts "***Menu***"
        puts "list".bold + " - see the list again"
        puts "1 ~ #{@news_articles.size}".bold + " - see more details about a specific news"
        puts "exit".bold + " - exit the app"

        choice = gets.strip.downcase
        clear_screen

        if choice.to_i > 0 && choice.to_i <= @news_articles.size
          news_detail(choice.to_i - 1)
        elsif choice == "list"
          list_news
        elsif choice == 'exit'
          goodbye          
        else
          puts "'#{choice}' is not a valid selection.  Please try again.".red
        end
      end
    end

    def news_detail(index)
      puts "Your requested article has the following details:\n\n"
      puts "Title: #{@news_articles[index].title}"
      puts "Author: #{@news_articles[index].author}"
      puts "Published Date: #{@news_articles[index].date}"
      puts "Short summary:\n#{@news_articles[index].synopsis}\n\n"

      puts "Would you like to read more? (y/n)"
      puts "  NOTE: this will open in your web browser".red
      choice = gets.strip.downcase

      system("open #{@news_articles[index].details_url}") if choice == 'y'
      clear_screen
    end

    def goodbye
      puts "Thank you for using this app.  See you next time!"
    end
end
