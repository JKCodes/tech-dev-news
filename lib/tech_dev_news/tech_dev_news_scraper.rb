require 'pry'
class TechDevNewsScraper
  attr_reader :base_url, :doc

  def initialize
    @base_url = "https://www.developer-tech.com"
    @doc = Nokogiri::HTML(open("#{self.base_url}/news/"))
  end

  def scrape
    # hash for array of hash for now
    self.doc.css('.news article').map do |article|
      article_meta_list = article.css('.meta_list h4').text.split(',')

      hasher = {
        title: article.css('a h2').text,
        author: article_meta_list[0][4..-1],
        date: article_meta_list[1][1..-1],
        synopsis: article.css('.summary').text,
        details_url: "#{self.base_url}" + article.css('a').attribute('href').value
      }
    end
  end
end