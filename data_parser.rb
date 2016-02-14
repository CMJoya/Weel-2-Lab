require "csv"
require "erb"


#read

html = File.read("report.erb")

#replace with values

page_title = "Planet Express Log"

responses = []

CSV.foreach("planet_express_log.csv", headers: true) do |row|
  responses << row.to_hash
end

money_delivered = responses.map do |responses|
  responses["Money"].to_i
end

fry = []
amy = []
bender = []
leela = []

destination = responses.map do |hashcut|
if hashcut["Destination"] == "Earth"
  fry << hashcut
elsif hashcut["Destination"] == "Mars"
  amy << hashcut
elsif hashcut["Destination"]== "Uranus"
  bender << hashcut
else
  leela << hashcut
end
end

puts "========"


total_fry_money = [30000,5000].reduce(:+)
total_amy_money = [15000].reduce(:+)
total_bender_money = [345600,10000].reduce(:+)
total_leela_money = [44500,3451,2344,1000,80000].reduce(:+)

total_money_delivered = [30000,5000,15000,345600,10000,445000,3451,2344,1000,80000].reduce(:+)


fry_money = fry.map do |hashcut|
  hashcut["Money"].to_i
end

amy_money = amy.map do |hashcut|
  hashcut["Money"].to_i
end

bender_money = bender.map do |hashcut|
  hashcut["Money"].to_i
end

leela_money = leela.map do |hashcut|
  hashcut["Money"].to_i
end


shipment = []

shipment = shipment.map do |hashcut|
  hashcut["Shipment"]
end

new_html = ERB.new(html).result(binding)

#writes the Html File
File.open("report.html", "wb") do |file|
  file.write(new_html)
  file.close
end


#jesses sample
# require 'csv'
# CSV.foreach("planet_express_logs.csv", headers: true) do |row|
#   puts row.inspect # replace with your logic
# end
