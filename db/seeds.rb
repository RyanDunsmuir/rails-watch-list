# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Bookmark.destroy_all
Movie.destroy_all

puts "Generating Movies..."

40.times do
  rand_seed_gen = Faker::Number.number(digits: 8)

  lotr_movie_type_1 = "#{Faker::Adjective.negative.capitalize} #{Faker::Fantasy::Tolkien.race} in #{Faker::Movies::LordOfTheRings.location}"
  lotr_movie_type_2 = "#{Faker::Movies::Hobbit.character} in #{Faker::Movies::LordOfTheRings.location}"
  lotr_movie_type_3 = "#{Faker::Adjective.positive.capitalize} #{Faker::Fantasy::Tolkien.race}"
  lotr_movie_type_4 = "#{Faker::Book.genre} of #{Faker::Movies::LordOfTheRings.character}"

  movie_title = [lotr_movie_type_1, lotr_movie_type_2, lotr_movie_type_3, lotr_movie_type_4].sample

  overview_1 = "#{movie_title} explores the #{Faker::Adjective.negative} side of #{Faker::Movies::LordOfTheRings.location}."
  overview_2 = "#{Faker::Movies::LordOfTheRings.character} fights #{Faker::Movies::LordOfTheRings.character} over #{Faker::Food.dish}."
  overview_3 = "#{Faker::Movies::Hobbit.character} joins a band of #{Faker::Fantasy::Tolkien.race} and ends up fighting #{Faker::Movies::Hobbit.character} in #{Faker::Movies::LordOfTheRings.location}."
  overview_4 = "#{Faker::Movies::Hobbit.character} eats too much #{Faker::Food.dish} and challenges #{Faker::Movies::LordOfTheRings.character} to a duel."
  overview_5 = "Discover the #{Faker::Book.genre} of #{Faker::Movies::LordOfTheRings.location} in #{movie_title}."

  movie_overview = [overview_1, overview_2, overview_3, overview_4, overview_5].sample

  rating = (Faker::Number.between(from: 0.0, to: 10.0)).round(2)

  poster_url = "https://picsum.photos/seed/#{rand_seed_gen}/600/400"

  movie = Movie.new(title: movie_title, overview: movie_overview, rating: rating, poster_url: poster_url)
  puts "added #{movie.title} - #{movie.overview} // #{movie.rating}"

  movie.save
end

puts "Done!"
