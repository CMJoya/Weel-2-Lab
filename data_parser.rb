require "csv"
require "erb"


#read

html = File.read("report.erb")

#replace with values

pageTitle = "Planet Express Log"

responses = []

CSV.foreach("planet_express_log.csv", headers: true) do |row|
  responses << row.to_hash
end

moneyDelivered = responses.map do |responses|
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


totalFryMoney = [30000,5000].reduce(:+).to_i
totalAmyMoney = [15000].reduce(:+).to_i
totalBenderMoney = [345600,10000].reduce(:+).to_i
totalLeelaMoney = [44500,3451,2344,1000,80000].reduce(:+).to_i

totalMoneyDelivered = [30000,5000,15000,345600,10000,445000,3451,2344,1000,80000].reduce(:+).to_i


fryMoney = fry.map do |hashcut|
  hashcut["Money"].to_i
end

amyMoney = amy.map do |hashcut|
  hashcut["Money"].to_i
end

benderMoney = bender.map do |hashcut|
  hashcut["Money"].to_i
end

leelaMoney = leela.map do |hashcut|
  hashcut["Money"].to_i
end

fryBonus = totalFryMoney * 0.10
amyBonus = totalAmyMoney * 0.10
benderBonus = totalBenderMoney * 0.10
leelaBonus = totalLeelaMoney * 0.10



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
