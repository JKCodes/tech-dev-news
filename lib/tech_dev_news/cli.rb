class TechDevNews::CLI

  def call
    greetings
    list_news

  end

  private

    def greetings
      # putting in a clear screen code I found few projects ago
      puts "\e[H\e[2J"
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
end