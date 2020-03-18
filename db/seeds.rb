# require "open-uri"

puts 'Destroy all database...'
Gamenight.destroy_all
Boardgame.destroy_all
Location.destroy_all
User.destroy_all

puts 'Creating some users...'

# photos
# file_1 = URI.open('https://img.static-rmg.be/a/view/q100/w/h450/1570130/zorro.jpg')
# file_2 = URI.open('https://vignette.wikia.nocookie.net/librerte/images/4/44/1200x630bb.jpg/revision/latest?cb=20190904083842&path-prefix=fr')
# file_3 = URI.open('https://risibank.fr/cache/stickers/d1503/150349-full.png')

user1 = User.new({username: "eve", email: "mattib@gmail.com", password: "ilikenobes" })
# user1.photo.attach(io: file_1, filename: 'matti.jpg', content_type: 'image/jpg')
user1.save!

user2 = User.new({username: "Thibault", email: "thibaulta@gmail.com", password: "vfvfvfvfv" })
# user2.photo.attach(io: file_2, filename: 'thibault.jpg', content_type: 'image/jpg')
user2.save!

user3 = User.new({username: "Theo", email: "theob@gmail.com", password: "azdazdazd" })
# user3.photo.attach(io: file_3, filename: 'theo.png', content_type: 'image/png')
user3.save!

puts "#{User.count} users have been created !"

puts 'Creating some boardgames...'

# file_4 = URI.open('https://i.ebayimg.com/images/g/tzYAAOSwqNxeD08j/s-l400.jpg')
boardgame_1 = Boardgame.new({
  name: " Uno",
  description: "jeux de cartes",
  players_min: 2,
  players_max: 8,
  category: "cartes",
  age: "10",
  user_id: user1.id
})
# game_1.photo.attach(io: file_4, filename: 'riskgot.jpg', content_type: 'image/jpg')
boardgame_1.save!

# file_5 = URI.open('https://static.fnac-static.com/multimedia/Images/FR/MDM/5f/2b/38/3681119/1505-1/tsp20200227140744/Jeu-de-strategie-Hasbro-Risk.jpg')
boardgame_2 = Boardgame.new({
  name: " Risk",
  description: "jeux de stratégie",
  players_min: 4,
  players_max: 6,
  category: "stratégie",
  age: "12",
  user_id: user2.id
})
# game_2.photo.attach(io: file_5, filename: 'risk.jpg', content_type: 'image/jpg')
boardgame_2.save!

# file_6 = URI.open('https://images-na.ssl-images-amazon.com/images/I/81G3u55HEHL._AC_SX425_.jpg')
boardgame_3 = Boardgame.new({
 name: " Burger Quizz",
  description: "jeux de plateau ",
  players_min: 4,
  players_max: 8,
  category: "ambiance",
  age: "16",
  user_id: user3.id
})
# game_3.photo.attach(io: file_6, filename: 'catan.jpg', content_type: 'image/jpg')
boardgame_3.save!

puts "#{Boardgame.count} boardgames have been created !"
puts 'boardgames created'


# file_7 = URI.open('https://cdn03.nintendo-europe.com/media/images/10_share_images/games_15/nintendo_switch_download_software_1/H2x1_NSwitchDS_Uno_image1600w.jpg')
location_1 = Location.new({
  name: "Le nexus",
  address: "52 cours julien,13006 Marseille",
  user_id: user1.id

})
# game_4.photo.attach(io: file_7, filename: 'uno.jpg', content_type: 'image/jpg')
location_1.save!

location_2 = Location.new({
  name: "Le nain jaune",
  address: "55a Rue 3 Frères Barthélémy,13006 Marseille",
  user_id: user2.id

})
# game_4.photo.attach(io: file_7, filename: 'uno.jpg', content_type: 'image/jpg')
location_2.save!

location_3 = Location.new({
  name: "Le dernier niveau",
  address: "319 Rue Saint-Pierre,13005 Marseille",
  user_id: user3.id

})
# game_4.photo.attach(io: file_7, filename: 'uno.jpg', content_type: 'image/jpg')
location_3.save!


puts "#{Location.count} locations have been created !"
puts 'locations created'


gamenight_1 = Gamenight.new({
  date: "2020-04-01",
  start_time:"20:00:00",
  end_time: "22:00:00",
  description: "Apportez des bieres",
  location_id: location_1.id,
  boardgame_id: boardgame_1.id

})
gamenight_1.save!

gamenight_2 = Gamenight.new({
  date: "2020-03-19",
  start_time:"18:00:00",
  end_time: "21:00:00",
  description: "cool soirée",
  location_id: location_2.id,
  boardgame_id: boardgame_2.id

})
gamenight_2.save!

gamenight_3 = Gamenight.new({
  date: "2020-03-22",
  start_time:"19:00:00",
  end_time: "23:00:00",
  description: "venez comme vous etes",
  location_id: location_3.id,
  boardgame_id: boardgame_3.id

})
gamenight_3.save!

puts "#{Gamenight.count} gamenights have been created !"
puts 'gamenights created'



