require 'bundler'
Bundler.require
$:.unshift File.expand_path("./../lib", __FILE__)
require 'text_extractor'
require 'watir'
require 'webdrivers'
require 'net/http'
require 'json'

def initialization
@browser = Watir::Browser.new 
end

def get_company_announces
url = "https://api.indeed.com/ads/apisearch?publisher=530916767722521&q=d%C3%A9veloppeur+or+devops+or+backend+or+frontend+or+data+or+fullstack&co=fr&v=2&latlong=1&fromage=1&limit=1000&start=#{@results}&sort=date&format=json"
uri = URI(url)
response = Net::HTTP.get(uri)
response = JSON.parse(response)
links = response["results"]
 links.map do |link|
url = link["url"]
uri = URI(url)
response = Net::HTTP.get(uri)
begin
  @jobkey = link["jobkey"]
  @company = link["company"]
  @city = link["city"]
  @latitude = link["latitude"]
  @longitude = link["longitude"]
  
  get_stacks_from_announce()
  if !@company.include?("Stack Elite"||"TsefonIT") && @data.length > 1 && @data != nil
    save_to_list()
  end
  @errors_count = 0
rescue
  @errors_count += 1
 puts "error - count #{@errors_count}"
end
 puts @list.length
end
@results += 25
end

def get_stacks_from_announce
  url = "https://api.indeed.com/ads/apigetjobs?publisher=530916767722521&jobkeys=#{@jobkey}&v=2&format=json"
  uri = URI(url)
  response = Net::HTTP.get(uri)
  response = JSON.parse(response)
  announce_link = response["results"][0]["url"]
  @browser.goto announce_link 
  text_extractor = TextExtractor.new
  announce = @browser.element(tag_name: 'body').text
  @data = text_extractor.get_stacks_from(announce)
end 

def save_to_list
  hash = Hash.new
  hash.store(:name,@company)
  hash.store(:city,@city)
  hash.store(:stacks,@data)
  hash.store(:latitude,@latitude)
  hash.store(:longitude,@longitude)
  @list << hash
end

def update_json(directory,file,list)
  puts "go json"
  array = []
  if !file
    source = "#{directory}indeed_#{Time.now}.json"
    file = File.new(source, "w")
    file.puts("[]")
    file.close
   else 
    source = "#{path}#{file}"
    
   end
   file = File.read(source)
  if file
    existing_entries = JSON.parse(file);
    existing_entries.to_a.map do |entry|
      array.push(entry)
    end
  end
  list.map do |company|
    array.push(company)
  end
  File.write(source, array.to_json)
end


def perform
  @retry_list =[]
  @input = ARGV.first
  @results = 200
  @list = []
  @errors_count = 0
  start = Time.now
  initialization()
  while @list.length < 200 && @errors_count < 2 do 
    get_company_announces()
  end
  update_json("./db/indeed_data/",false,@list)
  ending = Time.now
  puts "time = #{ending - start} seconds"
end

perform()