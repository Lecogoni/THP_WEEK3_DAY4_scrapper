require 'bundler'
Bundler.require
require 'rubygems'
require 'nokogiri'
require 'open-uri'
require 'httparty'
require 'byebug'

# mail mairie des Avernes

# def get_townhall_email
#   url = "http://annuaire-des-mairies.com/95/avernes.html"
#   doc = Nokogiri::HTML(URI.open(url))
#   email = doc.xpath('/html/body/div[1]/main/section[2]/div/table/tbody/tr[4]/td[2]').text
#   puts email
# end


# get_townhall_email

# liste des emails des mairie du 95


url_liste95 = "http://annuaire-des-mairies.com/val-d-oise.html"

doc = Nokogiri::HTML(URI.open(url_liste95))

list = doc.xpath('//*[@class="lientxt"]')
list_href = doc.xpath('//a[@class="lientxt"]/@href ')
list_name = doc.xpath('//a[@class="lientxt"] ').text

city_contact = {}



list.each do |city|
  url_begin = "http://annuaire-des-mairies.com/"
  puts city.content.downcase.capitalize # => donne le nom de la ville
  # puts city.xpath('//a[@class="lientxt"]/@href ').to_s.split("./")
  #puts url_begin 
  #url_end = city.xpath('//a[@class="lientxt"]/@href ')
end


def get_all_urls
	url_liste95 = "http://annuaire-des-mairies.com/val-d-oise.html"
	doc = Nokogiri::HTML(URI.open(url_liste95))
	list_href = doc.xpath('//a[@class="lientxt"]/@href ').to_s.split("./")
	full_url = ""

	list_href.each do |urlend|
		full_url = "http://annuaire-des-mairies.com/" + urlend
		puts full_url
	end

end

#get_all_urls



# list.collect do |city|
#   puts city.xpath('//a[@class="lientxt"] ')
# end


# list.each do |line|
#   puts "#{doc.xpath('//a[@class="lientxt"]/@href ')} et #{doc.xpath('//a[@class="lientxt"] ').text}"
# end

#puts list_href



#//*[@id="voyance-par-telephone"]/table/tbody/tr[2]/td/table/tbody








