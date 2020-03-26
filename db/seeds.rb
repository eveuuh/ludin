require "open-uri"

puts 'Destroy all database...'

Participation.destroy_all
Gamenight.destroy_all
Boardgame.destroy_all
Location.destroy_all
User.destroy_all

puts 'Creating some users...'

# photos
file_1 = URI.open("https://media-exp1.licdn.com/dms/image/C5603AQHGtG5xDFaCoQ/profile-displayphoto-shrink_200_200/0?e=1590624000&v=beta&t=8NO3a_1xAB4VjMhqAicVwcRgipFyJJ9qaBui0tGT9dM")
file_2 = URI.open('https://media-exp1.licdn.com/dms/image/C5603AQE-cZ6NtSOuCw/profile-displayphoto-shrink_200_200/0?e=1590624000&v=beta&t=uurZLfxIa_ylzf24p9owIVYjhL0IObfTK2cqUnDCuQQ')
file_3 = URI.open('https://media-exp1.licdn.com/dms/image/C5603AQGookoe-K8dLw/profile-displayphoto-shrink_200_200/0?e=1590624000&v=beta&t=VF775I2vJEVdbh3NKuZA1T9pFujiBsj-rQZLdfAabtA')
file_4 = URI.open('https://media-exp1.licdn.com/dms/image/C4D03AQHaRXdyF-08Vw/profile-displayphoto-shrink_200_200/0?e=1590624000&v=beta&t=uRIR7DNeeNi0w3Bm5WF25en2KS07E-UZN8MCadyYy1Y')

user1 = User.new({username: "Eve", email: "eve@gmail.com", password: "password" })
user1.photo.attach(io: file_1, filename: 'eve.png', content_type: 'image/png')
user1.save!

user2 = User.new({username: "Kévin", email: "kevin@gmail.com", password: "password" })
user2.photo.attach(io: file_2, filename: 'kevin.png', content_type: 'image/png')
user2.save!

user3 = User.new({username: "Bertrand", email: "bertrand@gmail.com", password: "password" })
user3.photo.attach(io: file_3, filename: 'bertrand.png', content_type: 'image/png')
user3.save!

user4 = User.new({username: "Sébastien", email: "sebastien@gmail.com", password: "password" })
user4.photo.attach(io: file_4, filename: 'sebastien.png', content_type: 'image/png')
user4.save!

puts "#{User.count} users have been created !"

puts 'Creating some boardgames...'

# file_4 = URI.open('https://i.ebayimg.com/images/g/tzYAAOSwqNxeD08j/s-l400.jpg')
boardgame_1 = Boardgame.new({
  name: "Dixit",
  description: "Jeux de déduction. Le but est de deviner à qui appartient chaque carte posées sur la table. Vous ne pourrez vous fiez qu'aux illustrations des cartes et à l'indice donné par le conteur",
  players_min: 3,
  players_max: 6,
  category: "Cartes",
  age: "8 ans et +",
  user_id: user1.id
})
# boardgame_1.photo.attach(io: file_4, filename: 'riskgot.jpg', content_type: 'image/jpg')
boardgame_1.save!

# file_5 = URI.open('https://static.fnac-static.com/multimedia/Images/FR/MDM/5f/2b/38/3681119/1505-1/tsp20200227140744/Jeu-de-strategie-Hasbro-Risk.jpg')
boardgame_2 = Boardgame.new({
  name: "Takenoko",
  description: "Jeux de plateau. Vous êtes un jardinier japonais du Moyen-Âge en charge de l'aménagement d'une bambouseraie. Votre but : prendre soin du nouveau locataire des jardins de l'Empereur : un panda. Attention, il est très affamé",
  players_min: 2,
  players_max: 4,
  category: "Plateau",
  age: "8 ans et +",
  user_id: user1.id
})
# boardgame_2.photo.attach(io: file_5, filename: 'risk.jpg', content_type: 'image/jpg')
boardgame_2.save!

# file_6 = URI.open('https://images-na.ssl-images-amazon.com/images/I/81G3u55HEHL._AC_SX425_.jpg')
boardgame_3 = Boardgame.new({
  name: "Risk",
  description: "Le jeu de conquête stratégique de référence ! Déplacez vos régiments, choisissez votre stratégie et que la conquête du monde commence ! Attendez-vous à passer de très longues parties autour de la table",
  players_min: 2,
  players_max: 6,
  category: "Stratégie",
  age: "10 ans et +",
  user_id: user2.id
})
# boardgame_3.photo.attach(io: file_6, filename: 'catan.jpg', content_type: 'image/jpg')
boardgame_3.save!

# file_7 = URI.open('https://images-na.ssl-images-amazon.com/images/I/81G3u55HEHL._AC_SX425_.jpg')
boardgame_4 = Boardgame.new({
  name: "Dungeons & Dragons",
  description: "Jeu de rôle. A la tête de votre faction, fouillez la cité de Waterdeep à la recherche de trésors enfouis et dissimulés. Mais soyez plus rapides que vos adversaires !",
  players_min: 2,
  players_max: 4,
  category: "Rôle",
  age: "14 ans et +",
  user_id: user2.id
})
# boardgame_4.photo.attach(io: file_7, filename: 'catan.jpg', content_type: 'image/jpg')
boardgame_4.save!

# file_8 = URI.open('https://images-na.ssl-images-amazon.com/images/I/81G3u55HEHL._AC_SX425_.jpg')
boardgame_5 = Boardgame.new({
  name: "River Dragons",
  description: "Chaque année dans le Delta du Mékong, un grand concours oppose les plus vaillants jeunes gens du royaume. En construisant les passerelles avec des planches et des pierres, ils doivent atteindre le village situé en face du leur.",
  players_min: 2,
  players_max: 6,
  category: "Adresse",
  age: "8 ans et +",
  user_id: user3.id
})
# boardgame_5.photo.attach(io: file_8, filename: 'catan.jpg', content_type: 'image/jpg')
boardgame_5.save!

# file_9 = URI.open('https://images-na.ssl-images-amazon.com/images/I/81G3u55HEHL._AC_SX425_.jpg')
boardgame_6= Boardgame.new({
  name: "Time's Up",
  description: "Avec Time's Up Party, faites deviner à votre équipe vos cartes en parlant ou en mimant. Gardez votre calme et soyez dans l'équipe qui aura obtenu le plus grand nombre de points.",
  players_min: 4,
  players_max: 10,
  category: "Ambiance",
  age: "12 ans et +",
  user_id: user3.id
})
# boardgame_6.photo.attach(io: file_9, filename: 'catan.jpg', content_type: 'image/jpg')
boardgame_6.save!

# file_10 = URI.open('https://images-na.ssl-images-amazon.com/images/I/81G3u55HEHL._AC_SX425_.jpg')
boardgame_7= Boardgame.new({
  name: "Perudo",
  description: "Perudo est un jeu de dés, mêlant probabilités et bluff. Analysez vos adversaires et vos jets dés. Soyez suffisamment rusé pour faire le bon pari et tromper les autres joueurs.",
  players_min: 2,
  players_max: 6,
  category: "Dés",
  age: "8 ans et +",
  user_id: user4.id
})
# boardgame_7.photo.attach(io: file_10, filename: 'catan.jpg', content_type: 'image/jpg')
boardgame_7.save!

# file_11 = URI.open('https://images-na.ssl-images-amazon.com/images/I/81G3u55HEHL._AC_SX425_.jpg')
boardgame_8= Boardgame.new({
  name: "Trivial Pursuit",
  description: "Le premier jeu de questions réponses. Jouez sur le plateau de jeu de vos souvenirs ! Avec 2400 questions réponses réparties en plusieurs thèmes. ",
  players_min: 2,
  players_max: 6,
  category: "Connaissance",
  age: "16 ans et +",
  user_id: user4.id
})
# boardgame_8.photo.attach(io: file_11, filename: 'catan.jpg', content_type: 'image/jpg')
boardgame_8.save!

puts "#{Boardgame.count} boardgames have been created !"

puts 'Creating some locations...'


location_1 = Location.new({
  name: "Le nexus",
  address: "52 cours julien, 13006 Marseille",
  user_id: user1.id

})
location_1.save!

location_2 = Location.new({
  name: "L'unic Bar",
  address: "11 Cours Jean Ballard, 13001 Marseille",
  user_id: user1.id

})
location_2.save!

location_3 = Location.new({
  name: "Domicile",
  address: "Place Ange Estève, 13480 Cabriès",
  user_id: user2.id

})
location_3.save!

location_4 = Location.new({
  name: "Le Wagon",
  address: "167 Rue Paradis, 13006 Marseille",
  user_id: user2.id

})
location_4.save!

location_5 = Location.new({
  name: "Domicile",
  address: "336 Avenue de Mazargues, 13008 Marseille",
  user_id: user3.id

})
location_5.save!

location_6 = Location.new({
  name: "Les Arpenteurs",
  address: "13 Rue Lanterne, 69001 Lyon",
  user_id: user3.id

})
location_6.save!

location_7 = Location.new({
  name: "Game Taverne",
  address: "22 Rue de Candolle, 34000 Montpellier",
  user_id: user4.id

})
location_7.save!

location_8 = Location.new({
  name: "Domicile",
  address: "136 Boulevard de la Valbarelle, 13011 Marseille",
  user_id: user4.id

})
location_8.save!

puts "#{Location.count} locations have been created !"

puts 'Creating some gamenights...'


gamenight_1 = Gamenight.new({
  date: "2020-04-02",
  start_time:"20:00:00",
  end_time: "22:00:00",
  description: "Qui veut jouer à Dixit ? On se retrouve au bar à jeux Le Nexus.",
  location_id: location_1.id,
  boardgame_id: boardgame_1.id
})
gamenight_1.save!

gamenight_2 = Gamenight.new({
  date: "2020-04-10",
  start_time:"19:00:00",
  end_time: "23:00:00",
  description: "Je souhaite faire découvrir le jeu Takenoko autour de moi. RdV au bar à jeux L'Unic.",
  location_id: location_2.id,
  boardgame_id: boardgame_2.id
})
gamenight_2.save!

gamenight_3 = Gamenight.new({
  date: "2020-04-07",
  start_time:"18:00:00",
  end_time: "23:59:00",
  description: "Grosse soirée Risk chez moi. Pour joueurs avertis. Chacun apporte à manger, on se fera un grand apéro.",
  location_id: location_3.id,
  boardgame_id: boardgame_3.id
})
gamenight_3.save!

gamenight_4 = Gamenight.new({
  date: "2020-04-15",
  start_time:"18:30:00",
  end_time: "23:00:00",
  description: "Initiation aux jeux de rôle.",
  location_id: location_4.id,
  boardgame_id: boardgame_4.id
})
gamenight_4.save!

gamenight_5 = Gamenight.new({
  date: "2020-04-07",
  start_time:"19:30:00",
  end_time: "22:00:00",
  description: "Venez découvrir un nouveau jeu d'adresse.",
  location_id: location_5.id,
  boardgame_id: boardgame_5.id
})
gamenight_5.save!

gamenight_6 = Gamenight.new({
  date: "2020-06-24",
  start_time:"12:00:00",
  end_time: "20:00:00",
  description: "Après-midi Time's Up pour fêter mon anniversaire",
  location_id: location_6.id,
  boardgame_id: boardgame_6.id
})
gamenight_6.save!

gamenight_7 = Gamenight.new({
  date: "2020-04-26",
  start_time:"12:00:00",
  end_time: "14:00:00",
  description: "Pause déj. avec un jeu de bluff.",
  location_id: location_7.id,
  boardgame_id: boardgame_7.id
})
gamenight_7.save!

gamenight_8 = Gamenight.new({
  date: "2020-04-05",
  start_time:"08:00:00",
  end_time: "20:00:00",
  description: "Tournoi de Trivial Pursuit",
  location_id: location_8.id,
  boardgame_id: boardgame_8.id
})
gamenight_8.save!

puts "#{Gamenight.count} gamenights have been created !"
