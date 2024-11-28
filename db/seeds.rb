require "date"
require "open-uri"


puts "========== 🪓 Suppression des Tasks 🪓 ============="

Task.destroy_all

puts "========== 🔨 Suppression des Cultures 🔨 =========="

Culture.destroy_all

puts "========== ⛏️ Suppression des Users ⛏️ ============="

User.destroy_all

puts "========== 🪄 Créations des Users 🪄 ==============="
user = User.create!(email: "master@gmail.com", password: "123456", username: "Master", address: "Toronto")
User.create!(email: "diane@gmail.com", password: "123456", username: "Diane", address: "11 rue mauvoisin, 44000, Nantes")
User.create!(email: "vivien@gmail.com", password: "123456", username: "Vivien", address: "8 place crousillat, 13300, Salon-de-Provence")
User.create!(email: "clement@gmail.com", password: "123456", username: "Clement", address: "34 rue du bel-air, 74000, Annecy")
User.create!(email: "anne-sophie@gmail.com", password: "123456", username: "Anne-sophie", address: "Japon, 〒533-0031 Osaka, Higashiyodogawa Ward, Nishiawaji, 5 Chome−15−10 1F")

puts "========== 🪄 #{User.count} users crées ! 🪄 ==================="

puts "========== 🔮 Créations des Cultures 🔮 ============"

master_ciboulette = Culture.create!(name: "Ciboulette", plantation_date: "2024-11-28", in_ground: false, outdoor: false, status: "Graine", master: true, user: user)

# culture.photo.attach(io: URI.open(data[:photo]), filename: "#{data[:name].parameterize}.jpg", content_type: "image/jpeg")
puts "========== 🔮 #{Culture.count} Cultures crée 🔮 ==================="

puts "========== 🪄 Créations des Tasks 🪄 ==============="

Task.create!(name: "Semer", description: "Semer les graines en pleine terre en les espaçant de 20 cm et à 10 cm de profondeur ou dans un grand pot en terre cuite de 30cm de diamètre.", date: nil, done: false,  order: nil, category: "Planter / Semer", delay: 0, culture: master_ciboulette)
Task.create!(name: "Arroser généreusement", description: "arroser généreusement pour que la terre permette l'enracinement", date: nil, done: false,  order: nil, category: "Arroser", delay: 0, culture: master_ciboulette)
Task.create!(name: "Arroser", description: "arroser pour maintenir la terre humide", date: nil, done: false,  order: nil, category: "Arroser", delay: 3, culture: master_ciboulette)
Task.create!(name: "Arroser", description: "arroser pour maintenir la terre humide", date: nil, done: false,  order: nil, category: "Arroser", delay: 6, culture: master_ciboulette)
Task.create!(name: "Arroser", description: "arroser pour maintenir la terre humide", date: nil, done: false,  order: nil, category: "Arroser", delay: 9, culture: master_ciboulette)
Task.create!(name: "Arroser", description: "arroser pour maintenir la terre humide", date: nil, done: false,  order: nil, category: "Arroser", delay: 12, culture: master_ciboulette)
Task.create!(name: "Arroser", description: "arroser pour maintenir la terre humide", date: nil, done: false,  order: nil, category: "Arroser", delay: 14, culture: master_ciboulette)
Task.create!(name: "Arroser", description: "arroser pour maintenir la terre humide", date: nil, done: false,  order: nil, category: "Arroser", delay: 20, culture: master_ciboulette)
Task.create!(name: "Désherber", description: "arroser pour maintenir la terre humide", date: nil, done: false,  order: nil, category: "Arroser", delay: 3, culture: master_ciboulette)
Task.create!(name: "Désherber", description: "arracher les mauvaises herbes autour des tiges de ciboulette pour éviter la concurrence", date: nil, done: false,  order: nil, category: "Désherber", delay: 20, culture: master_ciboulette)
Task.create!(name: "Arroser", description: "arroser pour maintenir la terre humide", date: nil, done: false,  order: nil, category: "Arroser", delay: 25, culture: master_ciboulette)
Task.create!(name: "Désherber", description: "arracher les mauvaises herbes autour des tiges de ciboulette pour éviter la concurrence", date: nil, done: false,  order: nil, category: "Désherber", delay: 25, culture: master_ciboulette)
Task.create!(name: "Désherber", description: "arracher les mauvaises herbes autour des tiges de ciboulette pour éviter la concurrence", date: nil, done: false,  order: nil, category: "Désherber", delay: 30, culture: master_ciboulette)
Task.create!(name: "Tailler", description: "couper les fleurs pour favoriser la croissance des tiges", date: nil, done: false,  order: nil, category: "Tailler", delay: 30, culture: master_ciboulette)
Task.create!(name: "Arroser", description: "arroser pour maintenir la terre humide", date: nil, done: false,  order: nil, category: "Arroser", delay: 30, culture: master_ciboulette)
Task.create!(name: "Désherber", description: "arracher les mauvaises herbes autour des tiges de ciboulette pour éviter la concurrence", date: nil, done: false,  order: nil, category: "Désherber", delay: 35, culture: master_ciboulette)
Task.create!(name: "Tailler", description: "couper les fleurs pour favoriser la croissance des tiges", date: nil, done: false,  order: nil, category: "Tailler", delay: 35, culture: master_ciboulette)
Task.create!(name: "Arroser", description: "arroser pour maintenir la terre humide", date: nil, done: false,  order: nil, category: "Arroser", delay: 35, culture: master_ciboulette)
Task.create!(name: "Désherber", description: "arracher les mauvaises herbes autour des tiges de ciboulette pour éviter la concurrence", date: nil, done: false,  order: nil, category: "Désherber", delay: 40, culture: master_ciboulette)
Task.create!(name: "Récolter", description: "couper les tiges à 15 cm de hauteur, seulement la moitié des tiges à la fois", date: nil, done: false,  order: nil, category: "Récolter", delay: 40, culture: master_ciboulette)
Task.create!(name: "Arroser", description: "arroser pour maintenir la terre humide", date: nil, done: false,  order: nil, category: "Arroser", delay: 40, culture: master_ciboulette)
Task.create!(name: "Tailler", description: "couper les fleurs pour favoriser la croissance des tiges", date: nil, done: false,  order: nil, category: "Tailler", delay: 45, culture: master_ciboulette)
Task.create!(name: "Arroser", description: "arroser pour maintenir la terre humide", date: nil, done: false,  order: nil, category: "Arroser", delay: 45, culture: master_ciboulette)
Task.create!(name: "Récolter", description: "couper les tiges à 15 cm de hauteur, seulement la moitié des tiges à la fois", date: nil, done: false,  order: nil, category: "Récolter", delay: 50, culture: master_ciboulette)
Task.create!(name: "Arroser", description: "arroser pour maintenir la terre humide", date: nil, done: false,  order: nil, category: "Arroser", delay: 50, culture: master_ciboulette)
Task.create!(name: "Récolter", description: "couper les tiges à 15 cm de hauteur, seulement la moitié des tiges à la fois", date: nil, done: false,  order: nil, category: "Récolter", delay: 60, culture: master_ciboulette)
Task.create!(name: "Arroser", description: "arroser pour maintenir la terre humide", date: nil, done: false,  order: nil, category: "Arroser", delay: 60, culture: master_ciboulette)

puts "========== 🪄 #{Task.count} Tasks crées 🪄 ===================="

puts "========== 🌹🌺🪻 Seeding terminé 🪻🌺🌹 ==========="
