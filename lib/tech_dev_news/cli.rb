class TechDevNews::CLI

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
      # putting in a fake list for now to test the app
      puts "1. What you need to know about iOS 12 - Ryan Daws - 06 June 2017"
      puts "2. Apple developers break $90 billion earnings as Swift Playgrounds expands to educate the next generation - Ryan Daws - 02 June 2017"
    end

    def menu
      choice = nil

      while choice != "exit"
        puts ""
        puts "***Menu***"
        puts "list - see the list again"
        puts "1 ~ 2 - see more details about a specific news"
        puts "exit - exit the app"

        choice = gets.strip.downcase
        clear_screen

        if choice.to_i > 0 && choice.to_i < 3
          puts "Deal ##{choice.to_i}'s information goes here"
        elsif choice == "list"
          list_news
        elsif choice == 'exit'
          puts ""
        else
          puts "'#{choice}' is not a valid selection.  Please try again."
        end
      end
    end
end








