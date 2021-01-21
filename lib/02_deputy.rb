require 'bundler'
Bundler.require
require 'rubygems'
require 'nokogiri'
require 'open-uri'
require 'httparty'
require 'byebug'


# def get_deputy_email
#   url = "https://www.nosdeputes.fr/francois-michel-lambert"
#   doc = Nokogiri::HTML(URI.open(url))
#   deputy_email = doc.xpath('//*[@id="b1"]/ul[2]/li[1]/ul/li/a').text
#   return deputy_email
# end

def get_deputy_email(deputy_url)
  doc = Nokogiri::HTML(URI.open(deputy_url))
  deputy_email = doc.xpath('//*[@id="b1"]/ul[2]/li[1]/ul/li[1]/a').text # attention certains ont deux mails li[1]/a ou li[2]/a
  return deputy_email
end


page = Nokogiri::HTML(URI.open("https://www.nosdeputes.fr/deputes"))
page_list = page.xpath('//*[@class="list_nom"]') # HTML class de chaque nom

page_list.each do |full_name|
  deputies_url = "https://www.nosdeputes.fr/"
  deputy_contact = {}
  contact_name_url = []
  name = full_name.content.strip
  # mise en forme du nom pour creation de la fin de l'url
  name_url = name.split(',')
  name_url_reverse = name_url.reverse
  name_url_final =  name_url_reverse.join("-").lstrip.downcase
  # enlever accent de name_url_final qui pose pbm pour l'url / regex peut-être incomplete
  name_url_final_flat = name_url_final.downcase.gsub(/[àáâãäå]/,'a').gsub(/æ/,'ae').gsub(/ç/, 'c').gsub(/[èéêë]/,'e').gsub(/[îïìíįī]/,'i') 
  deputy_url = deputies_url + name_url_final_flat.gsub(" ", "-")
  # creation des données du hash
  deputy_contact['first_name'] = name_url_reverse[0]
  deputy_contact['last_name'] = name_url_reverse[1]
  begin
    deputy_contact['email'] = get_deputy_email(deputy_url)
  rescue
      next
  end
  print deputy_contact
end


 #get_deputy_email("https://www.nosdeputes.fr/eric-alauzet")
 #get_deputy_email("https://www.nosdeputes.fr/bruno-nestor-azerot")
 
