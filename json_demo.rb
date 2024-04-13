require "json"

# TODO - let's read/write data from beatles.json
filepath = "data/beatles.json"

# parsing JSON

# 1 - Read the file - File.read takes the data from a JSON file and returns it as a string

serialized_beatles = File.read(filepath)
# p serialized_beatles

# 2 - JSON.parse - Turn the string into a code ruby can understand

beatles = JSON.parse(serialized_beatles)
# p beatles


# Storing JSON

# Hash data we want to save to a JSON file

beatles = { beatles: [
  {
    first_name: "John",
    last_name: "Lennon",
    instrument: "Guitar"
  },
  {
    first_name: "Paul",
    last_name: "McCartney",
    instrument: "Bass Guitar"
  },
  # etc...
]}

# File.open opens our JSON file to be able to write over it.
# Syntax very similar to CSV.open
# filepath is the file we want to write to
# "wb" is the mode, in this case write binary, essentially overwrite the files current contents

File.open(filepath, "wb") do |file|
  # Taking our beatles hash, turning it into a string to write into our JSON file
  # JSON.generate / pretty_generate takes a hash as an argument and turns it into a string
  # JSON.generate and JSON.pretty_generate do the same thing.
  # JSON.generate is less human readable, but also uses less memory
  # JSON.pretty_generate is more human readable, but also uses less memory

  # jsondbeatles = JSON.generate(beatles)
  jsondbeatles = JSON.pretty_generate(beatles)

  # file.write takes our string and then writes it to our JSON file.
  file.write(jsondbeatles)
end
