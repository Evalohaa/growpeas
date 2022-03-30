# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
  # movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
  # Character.create(name: 'Luke', movie: movies.first)

  # %w[yoga ski fitness nage cuisine-thaï cuisine-italienne potterie peinture sculpture chinois italien
  # russe ukrainien roumain violon piano guitare chant ukulele]

Activity.destroy_all
Category.destroy_all

cat_sport = Category.create(name: "sport")
cat_musique = Category.create(name: "musique")
cat_arts = Category.create(name: "arts")
cat_langues = Category.create(name: "langues")
cat_cuisine = Category.create(name: "cuisine")

sport_activities = %w[yoga ski fitness nage]

sport_activities.each do |name|
  Activity.create(name: name, category: cat_sport)
end

musique_activities = %w[violon piano guitare chant ukulele]

musique_activities.each do |name|
  Activity.create(name: name, category: cat_musique)
end

arts_activities = %w[potterie peinture sculpture]

arts_activities.each do |name|
  Activity.create(name: name, category: cat_arts)
end

langues_activities = %w[chinois italien russe ukrainien roumain]

langues_activities.each do |name|
  Activity.create(name: name, category: cat_langues)
end

cuisine_activities = %w[cuisine-thaï cuisine-italienne]

cuisine_activities.each do |name|
  Activity.create(name: name, category: cat_cuisine)
end
