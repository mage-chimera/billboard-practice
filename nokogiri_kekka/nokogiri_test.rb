require 'nokogiri'
require 'csv'

CSV.open("seed_songs.csv", "w") do |csv|
  for year in 1990..2014 do
    f = File.open("#{year}.html")
    doc = Nokogiri::HTML(f)
    f.close()

    doc.css("table.wikitable.sortable tr").each_with_index do |node, index|
      next if index == 0
      ranking = node.css("th").inner_text
      title   = node.css("td:eq(1)").inner_text.gsub(/^"/, "").gsub(/"$/, "")
      artist  = node.css("td:eq(2)").inner_text
      csv << [title, artist, ranking, year]
    end
  end
end
