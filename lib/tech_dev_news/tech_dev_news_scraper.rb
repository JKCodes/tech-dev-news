class TechDevNewsScraper
  attr_reader :base_url, :doc

  def initialize
    @base_url = "https://www.developer-tech.com"
    @doc = Nokogiri::HTML(open("#{self.base_url}/news/"))
  end

  def scrape
    # hash for array of hash for now
    self.doc.css('.news article').map do |news_article|
      news_meta_list = news_article.css('.meta_list h4').text.split(',')

      news =  News.new
      news.title = news_article.css('a h2').text
      news.author = news_meta_list[0][4..-1]
      news.date = news_meta_list[1][1..-1]
      news.synopsis = news_article.css('.summary').text
      news.details_url = "#{self.base_url}" + news_article.css('a').attribute('href').value

      news
    end
  end
end