# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require "csv"

CSV.foreach('db/seed_songartists.csv') do |row|
  SongArtist.create(:song_id => Song.find_by(title: row[0], ranking: row[2], year: row[3]).id,
                  :artist_id => Artist.find_by(name: row[1]).id)
end
