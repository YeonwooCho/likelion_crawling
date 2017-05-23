class Article < ApplicationRecord
  def self.news_title(params)
    agent = Mechanize.new
    (Article.news_counter(params).to_a).each do |index|
    page = agent.get "https://search.naver.com/search.naver?ie=utf8&where=news&query=#{params}&start=#{index}"
    list = page.search('a._sp_each_url _sp_each_title').map(&:text)
    list.each do |title|
      Article.create(title: title)
      end
    end
  end
  
  def self.news_counter(params)
    agent = Mechanize.new
    page = agent.get "https://search.naver.com/search.naver?ie=utf8&where=news&query=#{params}&start=1"
    list = page.search('div.title_desc all_my').map(&:text).to_s
    number = list.split('/').last.delete('건').delete(',').to_i
    return (0..number/10).to_a.map{|x| x*10 + 1}
  end
   
end


  def self.search(search)
    if search
      where('title LIKE ?', "%#{search}%")
    else
      all
    end
  end

