class News
  attr_accessor :title, :author, :date, :synopsis, :details_url

  # returns a handy string version of itself that contains the title, the author, and the date
  def to_s
    "#{self.title} - #{self.author} - #{self.date}"
  end
end