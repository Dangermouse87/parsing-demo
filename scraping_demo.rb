require "open-uri"
require "nokogiri"

# Let's scrape recipes from https://www.bbcgoodfood.com

ingredient = "taco"
url = "https://www.bbcgoodfood.com/search?q=#{ingredient}"


# URI.open.read takes a website, and returns a string with all of the data
html_file = URI.open(url).read
# p html_file

# Nokogiri converts the string data from URI.open.read and returns it as a Nokogiri document
html_doc = Nokogiri::HTML(html_file)
# p html_doc

############################################
# search looks inside our Nokogiri document for a specific part of the page using a CSS selector.
# To search CSS selectors, we need to place a "." before the class.
# If you want to look even further in, we can also declare a nested selector (a css selector inside another css selector)
# In our case, we are look at the ".card__section.card__content", and inside that we are looking at ".link.d-block"
############################################

search = html_doc.search(".card__section.card__content .link.d-block")


# we iterate over the search results

search.each do |element|

  # we then use another select another CSS selector to find the info we want to find.
  # we use "text" to display the text inside this.
  # text.strip displays the text without any unnecessary whitespaces(spaces)
  title = element.css("h2.heading-4").text.strip
  # we select the attribute when we want information like any URL links. Attributes can be used for href (urls), class (css classes), style (used for making HTML pretty)
  link = element.attribute("href").value

  puts title

  # this is a quick boolean check. Puts the link if the link exists.
  puts link if link
end
