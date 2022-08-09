require 'csv'
data = CSV.read("numbers.csv")
puts data

CSV.open("numbers.csv", "a") do |csv|
  csv << [8, 80, 800]
  csv << [9, 90, 900]
end
data = CSV.read("numbers.csv")
puts data

