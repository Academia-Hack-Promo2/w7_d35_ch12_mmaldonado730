require 'httparty'

class Mashable
  include HTTParty
  base_uri 'http://mashable.com/stories.json'

  def noticia
   n_mashable = Array.new
   response = HTTParty.get('http://mashable.com/stories.json')  
   response["new"].each do |noticiass|
   noticiass = {} 
   puts noticiass['title']
   puts noticiass['author']
   puts noticiass['post_date']
   puts noticiass['link']
   end
  end
end

class Digg
  include HTTParty
  base_uri 'http://digg.com/api/news/popular.json'
  def noticia
    n_digg = Array.new
    response = HTTParty.get('http://digg.com/api/news/popular.json')
    response["data"]["feed"].each do |noticiass|
    puts noticiass["content"]["title_alt"]
    puts noticiass["content"]["author"]+' ***************'
    puts noticiass["content"]["url"]
    puts noticiass["content"]["date_published"]
    end
  end
end


class Reddit 
  include HTTParty
  base_uri 'http://www.reddit.com/.json'
  def noticia
    n_reddit = Array.new
    response = HTTParty.get('http://www.reddit.com/.json')
    response["data"]["children"].each do |noticiass|
    puts noticiass['data']['title']
    puts noticiass['data']['author']+' ***************'
    puts noticiass['data']['created']
    puts noticiass['data']['url']
    end
  end
end


def main
  print 'Mashable--------------------------------------------------------'
  m_mashable = Mashable.new
  m_mashable.noticia
  print 'Reddit----------------------------------------------------------'
  r_reddit = Reddit.new
  r_reddit.noticia
  print 'Digg------------------------------------------------------------'
  d_digg = Digg.new
  d_digg.noticia
end

main



