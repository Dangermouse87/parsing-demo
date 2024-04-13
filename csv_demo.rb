require "csv"

# TODO - let's read/write data from beatles.csv
filepath = "data/beatles.csv"

# parsing CSV

# opening a CSV file

# CSV.foreach takes our CSV file, and iterates over every element inside our file.

# (filepath, headers: :true)
# filepath refers to the actual file we are trying to open
# headers: :true essentially tells ruby to ignore the first row
# headers: :true also turns each array element into a key:value pair

CSV.foreach(filepath, headers: :true) do |row|
  # without headers: :true, we access the values like a normal array
  # puts "#{row[0]} #{row[1]} plays the #{row[2]}"

  # with headers: :true, we access the values like you would a hash
  "#{row['First Name']} #{row['Last Name']} played #{row['Instrument']}"
end

# storing CSVs

# filepath is the file we want to write to
# |csv| is the name we give to the csv as a placeholder
# wb - write binary, essentially rewrites the whole file

CSV.open(filepath, "wb") do |csv|
  csv << ["First Name", "Last Name", "Instrument"]
  csv << ["John", "Lennon", "Guitar"]
end
