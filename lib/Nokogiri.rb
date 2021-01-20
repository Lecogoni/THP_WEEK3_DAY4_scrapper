require 'bundler'
Bundler.require
require 'rubygems'
require 'httparty'

########## HTTP Party ##########

def scrapper
  page_url = "http://ruby.bastardsbook.com/"
  unparsed_page = HTTParty.get(page_url)
  #parsed_page = Nokogiri::HTML(unparsed_page)
  puts unparsed_page
  #byebug
end

scrapper


########## NOKOGIRI##########

require 'nokogiri'
require 'open-uri'


def crypto_scrapper_title(selector)
  page_url = "http://ruby.bastardsbook.com/"
  page = Nokogiri::HTML(open(page_url))
  puts page.css(selector).text
end

#crypto_scrapper_title("title") # => recup la balise title et non la class title

def crypto_scrapper_link(selector)
  page_url = "http://ruby.bastardsbook.com/"
  page = Nokogiri::HTML(open(page_url))
  news_links = page.css(selector).select{|link| link} 
end

#crypto_scrapper_link("a")



def crypto_scrapper_note 
  page_url = "http://ruby.bastardsbook.com/"
  page = Nokogiri::HTML(open(page_url))
  notes = page.css('section')[0].css("div").css("p").text.strip
  puts notes
end

#crypto_scrapper_note # => recup la premiere note de la premiere section




########## BASTARD BOOK XPATH ##########

# page.xpath(//*[@id="overview"]/div/p)

