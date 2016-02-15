require "csv"
require "erb"

#read

html = File.read("report.erb")

#replace with values

pageTitle = "Planet Express Log"

response = []

CSV.foreach("planet_express_log.csv", headers: true) do |row|
  response << row.to_hash
end

totalMoneyDelivered = response.map do |response|
  response ["Money"].to_i
end

fry = []
amy = []
bender = []
leela = []


destination = response.each do |hashcut|
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
totalFryMoney = fryMoney.reduce(:+).to_i
totalAmyMoney = amyMoney.reduce(:+).to_i
totalBenderMoney = benderMoney.reduce(:+).to_i
totalLeelaMoney = leelaMoney.reduce(:+).to_i

totalMoneyDelivered = totalMoneyDelivered.reduce(:+).to_i

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
