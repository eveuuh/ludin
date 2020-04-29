require "open-uri"

puts 'Destroy participation database...'

Participation.destroy_all

puts 'Destroy gamenight database...'

Gamenight.destroy_all

puts 'Destroy boardgame database...'

Boardgame.destroy_all

puts 'Destroy location database...'

Location.destroy_all

puts 'Destroy user database...'

User.destroy_all

puts 'Find some photos...'

# photos
file_1 = Rails.root.join("app/assets/images/eve.jpeg").open
file_2 = Rails.root.join("app/assets/images/kevin.jpeg").open
file_3 = Rails.root.join("app/assets/images/bertrand.jpeg").open
file_4 = Rails.root.join("app/assets/images/sebastien.jpeg").open

puts 'Creating some users...'

user1 = User.new({username: "Eve", email: "eve@gmail.com", password: "password" })
user1.photo.attach(io: file_1, filename: 'eve.jpeg', content_type: 'image/jpeg')
user1.save!

user2 = User.new({username: "Kevin", email: "kevin@gmail.com", password: "password" })
user2.photo.attach(io: file_2, filename: 'kevin.jpeg', content_type: 'image/jpeg')
user2.save!

user3 = User.new({username: "Bertrand", email: "bertrand@gmail.com", password: "password" })
user3.photo.attach(io: file_3, filename: 'bertrand.jpeg', content_type: 'image/jpeg')
user3.save!

user4 = User.new({username: "Sébastien", email: "sebastien@gmail.com", password: "password" })
user4.photo.attach(io: file_4, filename: 'sebastien.jpeg', content_type: 'image/jpeg')
user4.save!

puts "#{User.count} users have been created !"

puts 'Creating some boardgames...'

file_5 = URI.open('https://cdn2.philibertnet.com/307631-large_default/dixit.jpg')
boardgame_1 = Boardgame.new({
  name: "Dixit",
  description: "Jeux de déduction. Le but est de deviner à qui appartient chaque carte posées sur la table. Vous ne pourrez vous fiez qu'aux illustrations des cartes et à l'indice donné par le conteur",
  players_min: 3,
  players_max: 6,
  category: "Cartes",
  age: "8 ans et +",
  user_id: user1.id
})
boardgame_1.photo.attach(io: file_5, filename: 'dixit.jpg', content_type: 'image/jpg')
boardgame_1.save!

file_6 = URI.open('https://cdn1.philibertnet.com/314274-large_default/takenoko.jpg')
boardgame_2 = Boardgame.new({
  name: "Takenoko",
  description: "Jeux de plateau. Vous êtes un jardinier japonais du Moyen-Âge en charge de l'aménagement d'une bambouseraie. Votre but : prendre soin du nouveau locataire des jardins de l'Empereur : un panda. Attention, il est très affamé",
  players_min: 2,
  players_max: 4,
  category: "Plateau",
  age: "8 ans et +",
  user_id: user1.id
})
boardgame_2.photo.attach(io: file_6, filename: 'takenoko.jpg', content_type: 'image/jpg')
boardgame_2.save!

file_7 = URI.open('https://cdn1.philibertnet.com/339595-large_default/risk-vf.jpg')
boardgame_3 = Boardgame.new({
  name: "Risk",
  description: "Le jeu de conquête stratégique de référence ! Déplacez vos régiments, choisissez votre stratégie et que la conquête du monde commence ! Attendez-vous à passer de très longues parties autour de la table",
  players_min: 2,
  players_max: 6,
  category: "Stratégie",
  age: "10 ans et +",
  user_id: user2.id
})
boardgame_3.photo.attach(io: file_7, filename: 'risk.jpg', content_type: 'image/jpg')
boardgame_3.save!

file_8 = URI.open('https://cdn3.philibertnet.com/434838-large_default/dungeons-dragons-vaults-of-dragons.jpg')
boardgame_4 = Boardgame.new({
  name: "Dungeons & Dragons",
  description: "Jeu de rôle. A la tête de votre faction, fouillez la cité de Waterdeep à la recherche de trésors enfouis et dissimulés. Mais soyez plus rapides que vos adversaires !",
  players_min: 2,
  players_max: 4,
  category: "Rôle",
  age: "14 ans et +",
  user_id: user2.id
})
boardgame_4.photo.attach(io: file_8, filename: 'dungeon.jpg', content_type: 'image/jpg')
boardgame_4.save!

file_9 = URI.open('https://cdn2.philibertnet.com/378184-large_default/river-dragons.jpg')
boardgame_5 = Boardgame.new({
  name: "River Dragons",
  description: "Chaque année dans le Delta du Mékong, un grand concours oppose les plus vaillants jeunes gens du royaume. En construisant les passerelles avec des planches et des pierres, ils doivent atteindre le village situé en face du leur.",
  players_min: 2,
  players_max: 6,
  category: "Adresse",
  age: "8 ans et +",
  user_id: user3.id
})
boardgame_5.photo.attach(io: file_9, filename: 'river.jpg', content_type: 'image/jpg')
boardgame_5.save!

file_10 = URI.open('https://cdn3.philibertnet.com/362537-large_default/times-up-party-version-jaune.jpg')
boardgame_6 = Boardgame.new({
  name: "Time's Up",
  description: "Avec Time's Up Party, faites deviner à votre équipe vos cartes en parlant ou en mimant. Gardez votre calme et soyez dans l'équipe qui aura obtenu le plus grand nombre de points.",
  players_min: 4,
  players_max: 10,
  category: "Ambiance",
  age: "12 ans et +",
  user_id: user3.id
})
boardgame_6.photo.attach(io: file_10, filename: 'timesup.jpg', content_type: 'image/jpg')
boardgame_6.save!

file_11 = URI.open('https://cdn2.philibertnet.com/305182-large_default/perudo.jpg')
boardgame_7 = Boardgame.new({
  name: "Perudo",
  description: "Perudo est un jeu de dés, mêlant probabilités et bluff. Analysez vos adversaires et vos jets dés. Soyez suffisamment rusé pour faire le bon pari et tromper les autres joueurs.",
  players_min: 2,
  players_max: 6,
  category: "Dés",
  age: "8 ans et +",
  user_id: user4.id
})
boardgame_7.photo.attach(io: file_11, filename: 'perudo.jpg', content_type: 'image/jpg')
boardgame_7.save!

file_12 = URI.open('https://cdn3.philibertnet.com/376564-large_default/trivial-pursuit-edition-classique.jpg')
boardgame_8 = Boardgame.new({
  name: "Trivial Pursuit",
  description: "Le premier jeu de questions réponses. Jouez sur le plateau de jeu de vos souvenirs ! Avec 2400 questions réponses réparties en plusieurs thèmes. ",
  players_min: 2,
  players_max: 6,
  category: "Connaissance",
  age: "16 ans et +",
  user_id: user4.id
})
boardgame_8.photo.attach(io: file_12, filename: 'trivial.jpg', content_type: 'image/jpg')
boardgame_8.save!

file_13 = URI.open('https://cdn3.philibertnet.com/443132-large_default/jungle-speed.jpg')
boardgame_9 = Boardgame.new({
  name: "Jungle Speed",
  description: "Jungle Speed est un grand classique des jeux de société qui allie simplicité, adrénaline, réflexes et observation. Jouez vos cartes et soyez le plus rapide à vous saisir du totem.",
  players_min: 2,
  players_max: 10,
  category: "Ambiance",
  age: "7 ans et +",
  user_id: user2.id
})
boardgame_9.photo.attach(io: file_13, filename: 'jungle.jpg', content_type: 'image/jpg')
boardgame_9.save!

puts "#{Boardgame.count} boardgames have been created !"

puts 'Creating some locations...'


location_1 = Location.new({
  name: "Le nexus",
  address: "30 Cours Lieutaud, 13001 Marseille",
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
  address: "246 Rue de Lyon, 13015 Marseille",
  user_id: user2.id

})
location_3.save!

location_4 = Location.new({
  name: "appart estaque",
  address: "72 Plage de l'Estaque, 13016 Marseille",
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
  address: "21 Boulevard de la Gaye, 13009 Marseille",
  user_id: user3.id

})
location_6.save!

location_7 = Location.new({
  name: "Game Taverne",
  address: "25 Rue du Refuge, 13002 Marseille",
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


gamenight_3 = Gamenight.new({
  date: "2020-06-07",
  start_time:"18:00:00",
  end_time: "23:59:00",
  description: "Grosse soirée Risk chez moi. Pour joueurs avertis.",
  location_id: location_3.id,
  boardgame_id: boardgame_3.id
})
gamenight_3.save!

gamenight_4 = Gamenight.new({
  date: "2020-03-15",
  start_time:"18:30:00",
  end_time: "23:00:00",
  description: "Initiation aux jeux de rôle.",
  location_id: location_4.id,
  boardgame_id: boardgame_4.id
})
gamenight_4.save!

gamenight_5 = Gamenight.new({
  date: "2020-03-07",
  start_time:"19:30:00",
  end_time: "22:00:00",
  description: "Venez découvrir un nouveau jeu d'adresse.",
  location_id: location_5.id,
  boardgame_id: boardgame_5.id
})
gamenight_5.save!

gamenight_6 = Gamenight.new({
  date: "2020-06-28",
  start_time:"19:00:00",
  end_time: "22:00:00",
  description: "Soirée détente bières-pizzas",
  location_id: location_6.id,
  boardgame_id: boardgame_6.id
})
gamenight_6.save!

gamenight_7 = Gamenight.new({
  date: "2020-05-26",
  start_time:"12:00:00",
  end_time: "14:00:00",
  description: "Pause déj. avec un jeu de bluff.",
  location_id: location_7.id,
  boardgame_id: boardgame_7.id
})
gamenight_7.save!

gamenight_8 = Gamenight.new({
  date: "2020-07-05",
  start_time:"08:00:00",
  end_time: "20:00:00",
  description: "Tournoi de Trivial Pursuit",
  location_id: location_8.id,
  boardgame_id: boardgame_8.id
})
gamenight_8.save!

gamenight_9 = Gamenight.new({
  date: "2020-06-28",
  start_time:"20:00:00",
  end_time: "22:00:00",
  description: "Soirée Jungle Speed pour décompresser après la semaine de taf",
  location_id: location_4.id,
  boardgame_id: boardgame_9.id
})
gamenight_9.save!

puts "#{Gamenight.count} gamenights have been created !"

puts 'Creating some participations...'

participation_1 = Participation.new({
  gamenight_id: gamenight_9.id,
  user_id: user3.id
})
participation_1.save!

participation_2 = Participation.new({
  gamenight_id: gamenight_3.id,
  user_id: user3.id
})
participation_2.save!

participation_3 = Participation.new({
  gamenight_id: gamenight_3.id,
  user_id: user4.id
})
participation_3.save!

participation_4 = Participation.new({
  gamenight_id: gamenight_5.id,
  user_id: user1.id,
})
participation_4.save!

participation_5 = Participation.new({
  gamenight_id: gamenight_5.id,
  user_id: user2.id,
  description: "Très bon moment de jeu",
  rating: 5
})
participation_5.save!

participation_6 = Participation.new({
  gamenight_id: gamenight_5.id,
  user_id: user4.id,
  description: "Pas mon style de jeu, mais bonne ambiance",
  rating: 3
})
participation_6.save!

participation_7 = Participation.new({
  gamenight_id: gamenight_5.id,
  user_id: user3.id,
})
participation_7.save!

puts "#{Participation.count} participations have been created !"
