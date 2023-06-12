require 'json'

# Read the contents of the JSON file
json_data = File.read('db/IGDB_data.json')

# Parse the JSON data
data = JSON.parse(json_data)

# Iterate over the data and create records
data.each do |item|
  # Extract relevant attributes
  name = item['name']
  cover_url = item['cover']['url'] if item['cover']
  release_date = Time.at(item['first_release_date']) if item['first_release_date']
  involved_company = item['involved_companies']&.map { |company| company['company']['name'] }
  player_perspective = item['player_perspectives']&.map { |perspective| perspective['name'] }
  aggregated_rating = item['aggregated_rating']
  aggregated_rating_count = item['aggregated_rating_count']
  summary = item['summary']
  genre_name = item['genres']&.first&.dig('name')
  platform_names = item['platforms']&.map { |platform| platform['name'] }


  # Find the genre by name or create a new one
  genre = Genre.find_or_create_by(name: genre_name)

  # Create a record using the extracted attributes
  Game.create(
    name: name,
    cover: cover_url,
    platform: platform_names,  # Update the platform attribute
    release_date: release_date,
    involved_company: involved_company,
    player_perspective: player_perspective,
    aggregated_rating: aggregated_rating,
    aggregated_rating_count: aggregated_rating_count,
    summary: summary,
    genre: genre
  )
end

puts 'Seeding Completed!'

# -------------------------------



# require 'httparty'
# require 'json'

# client_id = ENV['IGDB_CLIENT_ID']
# authorization = ENV['IGDB_AUTHORIZATION']

# response = HTTParty.get('https://api.igdb.com/v4/games/', headers: {
#   'Client-ID' => client_id,
#   'Authorization' => "Bearer #{authorization}",
#   'Accept' => 'application/json'
# }, body: 'fields aggregated_rating, aggregated_rating_count, cover.url, first_release_date, genres.name, involved_companies.company.name, name, platforms.name, player_perspectives.name, rating, rating_count, summary, total_rating, total_rating_count;')

# games_data = JSON.parse(response.body)

# games = games_data.map do |game|
#   {
#     name: game['name'],
#     cover: game['cover']['url'],
#     platform: game['platforms'][0]['name'], 
#     release_date: game['first_release_date'],
#     involved_company: game['involved_companies'][0]['company']['name'], 
#     player_perspective: game['player_perspectives'][0]['name'],
#     aggregated_rating: game['aggregated_rating'],
#     aggregated_rating_count: game['aggregated_rating_count'],
#     summary: game['summary'],
#     genre: game['genres'][0]['name']
#   }
# end

# games.each do |game_data|
#   Game.create(game_data)
# end
