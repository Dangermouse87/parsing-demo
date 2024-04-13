require "json"
require "open-uri"

url = "https://api.github.com/users/dangermouse87"

# Parsing a JSON API

# Similar to parsing a JSON file

# 1 - get the data from a JSON file
# URI.open(URL).read - gets the JSON api data, and returns it as a string
# URI.open.read does the same thing as File.read but using a URL instead of a file.

user_data = URI.open(url).read
# p user_data

# 2 - open the data in a format Ruby can understand.
# JSON.parse, takes the string and returns the data as a hash

user = JSON.parse(user_data)
# p user

# pretty_generate just displays the data in a human readable manner in the terminal but remember it takes more memory
pretty_user = JSON.pretty_generate(user)
puts pretty_user
