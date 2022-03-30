# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
  # movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
  # Character.create(name: 'Luke', movie: movies.first)

  # %w[yoga ski fitness nage cuisine-thaï cuisine-italienne potterie peinture sculpture chinois italien
  # russe ukrainien roumain violon piano guitare chant ukulele]

User.destroy_all
Course.destroy_all
Activity.destroy_all
Category.destroy_all

cat_sport = Category.create(name: "sport")
cat_musique = Category.create(name: "musique")
cat_arts = Category.create(name: "arts")
cat_langues = Category.create(name: "langues")
cat_cuisine = Category.create(name: "cuisine")
cat_artisanat = Category.create(name: "artisanat")

sport_activities = %w[yoga ski fitness nage]

sport_activities.each do |name|
  Activity.create(name: name, category: cat_sport)
end

musique_activities = %w[violon piano guitare chant ukulele]

musique_activities.each do |name|
  Activity.create(name: name, category: cat_musique)
end

arts_activities = %w[potterie sculpture]

arts_activities.each do |name|
  Activity.create(name: name, category: cat_arts)
end

langues_activities = %w[chinois russe ukrainien roumain]

langues_activities.each do |name|
  Activity.create(name: name, category: cat_langues)
end

cuisine_activities = %w[cuisine-thaï cuisine-francaise]

cuisine_activities.each do |name|
  Activity.create(name: name, category: cat_cuisine)
end

artisanat_activities = %w[couture macramé]
artisanat_activities.each do |name|
  Activity.create(name: name, category: cat_artisanat)
end

tennis = Activity.create(name: 'tennis', category: cat_sport)
percussion = Activity.create(name: 'percussion', category: cat_musique)
peinture = Activity.create(name: 'peinture', category: cat_arts)
italien = Activity.create(name: 'italien', category: cat_langues)
cuisine_italienne = Activity.create(name: 'cuisine-italienne', category: cat_cuisine)
encadrement = Activity.create(name: 'encadrement', category: cat_artisanat)

julien = User.create(first_name: 'Julien', last_name: 'Dupont', username: 'juli85', age: 30, phone_number: 06_25_62_36_57, email: 'juli85@free.fr', password: 'qwerty')
User.create(first_name: 'Philippe', last_name: 'Bourgeois', username: 'pb796', age: 28, phone_number: 06_35_45_74_36, email: 'phil@orange.fr', password: 'asedrt')
User.create(first_name: 'George', last_name: 'Bellemer', username: 'geo26', age: 26, phone_number: 06_63_56_74_14, email: 'george@sfr.fr', password: 'asdfgh')

Course.create(name: 'Les bases de tennis', duration: 2,
              description: "Apprendre les bases pour jouer du tennis entre amis", price: 30, address: '23 Rue de Paris',
              max_of_attendees: 5, activity: tennis, user: julien)
Course.create(name: 'La batterie pour le rock', duration: 2,
              description: "Connaitre les type de rythmes du rock", price: 50, address: '23 Rue de Paris',
              max_of_attendees: 1, activity: percussion, user: julien)
Course.create(name: 'Peinture impressioniste', duration: 2,
              description: "Apprendre la technique des impressionistes", price: 30, address: '23 Rue de Paris',
              max_of_attendees: 5, activity: peinture, user: julien)
Course.create(name: 'Italien debutant', duration: 2,
              description: "Converser avec des phrases de bases", price: 25, address: '23 Rue de Paris',
              max_of_attendees: 5, activity: italien, user: julien)
Course.create(name: "Les pates a l'italienne", duration: 2,
              description: "Apprendre cuire des pates al dente", price: 30, address: '23 Rue de Paris',
              max_of_attendees: 5, activity: cuisine_italienne, user: julien)
Course.create(name: 'Encadrement pour les passiones', duration: 2,
              description: "Connaitre des diverses techniques sur l'encadrement", price: 35, address: '23 Rue de Paris',
              max_of_attendees: 5, activity: encadrement, user: julien)
