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
fry_money = fry.map do |hashcut|
  hashcut["Money"]
end
puts fry_money.inspect

# puts money_delivered.inspect
#   employee = employee.uniq
#

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
