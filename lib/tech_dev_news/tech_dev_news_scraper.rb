class TechDevNewsScraper
  attr_reader :doc

  def initialize
    @doc = Nokogiri::HTML(open("https://www.developer-tech.com/news/"))
  end

  def basic_scrape

  end
end