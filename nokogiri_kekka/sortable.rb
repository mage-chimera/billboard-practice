require 'nokogiri'

f = File.open("2014.html")
doc = Nokogiri::HTML(f)
f.close()

doc.css("table.wikitable.sortable tr").each do |node|
  puts node
end
