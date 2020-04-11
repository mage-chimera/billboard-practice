require "csv"

SeedFu.quiet = true

CSV.foreach('db/seed_songartists.csv') do |row|
  SongArtist.seed(:song_id, :artist_id) do |s|
    s.song_id   = Song.find_by(title: row[0], ranking: row[2], year: row[3]).id
    s.artist_id = Artist.find_by(name: row[1]).id
  end
end
