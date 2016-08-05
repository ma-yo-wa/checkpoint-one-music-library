class MusicLibraryController

  def initialize(path = "./db/mp3s")
    MusicImporter.new(path).import
  end

  def call
    input = ""
    puts "Welcome to Your Music Library!"
    while input != "exit"
      puts "Type \"list songs\" to view all songs"
      puts "Type \"list artists\" to view all artists"
      puts "Type \"list genres\" to view songs' genres"
      puts "Type \"play song\" to play a song"
      puts "Type \"list artist\" to view a particular artist's song"
      puts "Type \"list genre\" to view a particular genre's song"
      puts "Type \"exit\" to leave the app"
      puts ""
      print ">"
      input = gets.strip
      commands(input)
    end
  end

  def commands(input)
    case input
      when "list songs"
        songs
      when "list artists"
        artists
      when "list genres"
        genres
      when "list artist"
        list_artist
      when "list genre"
        list_genre
      when "play song"
        play_song
      else
      puts "Please Input a Valid Entry"
      end
  end

  def artists
    Artist.all.each.with_index(1) do |a, i|
      puts "#{i}. #{a}"
    end
  end

  def genres
    Genre.all.each.with_index(1) do |g, i|
      puts "#{i}. #{g}"
    end
  end

  def list_artist
    puts "What artist by name would you like to list songs for?"
    artist_input = gets.strip
    if artist = Artist.find_by_name(artist_input)
      artist.songs.each do |s,i|
        puts "#{i}. #{s}"
      end
    end
  end

  def list_genre
    puts "What genre by name would you like to list songs for?"
    genre_input = gets.strip
    if genre = Genre.find_by_name(genre_input)
      genre.songs.each do |s,i|
        puts "#{i}. #{s}"
      end
    end
  end

  def play_song
    puts "What song number would you like to play?"
    song_input = gets.strip
    puts "Playing #{Song.all[song_input.to_i-1]}"
  end

  def songs
    puts "-" * 70
    puts "Songs in the Library"
    puts "-" * 70
    Song.all.each.with_index(1) do |s, i|
    puts "#{i}. #{s}"
    end
    puts "-" * 70
  end
end