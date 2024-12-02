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

master_ciboulette = Culture.create!(name: "Ciboulette", plantation_date: "2024-11-29", in_ground: false, outdoor: false, status: "Graine", master: true, user: user)
master_ciboulette.photo.attach(io: URI.open("https://images.unsplash.com/photo-1719722628937-4e83eade87f6?q=80&w=2073&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"), filename: "ciboulette.jpg", content_type: "image/jpeg")

master_tomate = Culture.create!(name: "Tomate", plantation_date: "2024-11-29", in_ground: false, outdoor: false, status: "Graine", master: true, user: user)
master_tomate.photo.attach(io: URI.open("https://images.unsplash.com/photo-1534940519139-f860fb3c6e38?q=80&w=2067&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"), filename: "tomate.jpg", content_type: "image/jpeg")

master_butternut = Culture.create!(name: "Butternut", plantation_date: "2024-11-29", in_ground: false, outdoor: false, status: "Graine", master: true, user: user)
master_butternut.photo.attach(io: URI.open("https://images.unsplash.com/photo-1575679472639-3f3fc9b86bf6?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"), filename: "butternut.jpg", content_type: "image/jpeg")

puts "========== 🔮 #{Culture.count} Cultures crée 🔮 ==================="
puts "====== 🪄 Créations des Tasks associé aux cultures 🪄 ============"
puts "============= 🌿 Task pour Master Ciboulette 🌿 ============"

Task.create!(name: "Semer", description: "Semer les graines en pleine terre en les espaçant de 20 cm et à 10 cm de profondeur ou dans un grand pot en terre cuite de 30cm de diamètre.", date: nil, done: false,  order: nil, category: "Planter", delay: 0, culture: master_ciboulette)
Task.create!(name: "Arroser ", description: "arroser généreusement pour que la terre permette l'enracinement", date: nil, done: false,  order: nil, category: "Arroser", delay: 0, culture: master_ciboulette)
Task.create!(name: "Arroser", description: "arroser pour maintenir la terre humide", date: nil, done: false,  order: nil, category: "Arroser", delay: 3, culture: master_ciboulette)
Task.create!(name: "Arroser", description: "arroser pour maintenir la terre humide", date: nil, done: false,  order: nil, category: "Arroser", delay: 6, culture: master_ciboulette)
Task.create!(name: "Arroser", description: "arroser pour maintenir la terre humide", date: nil, done: false,  order: nil, category: "Arroser", delay: 9, culture: master_ciboulette)
Task.create!(name: "Arroser", description: "arroser pour maintenir la terre humide", date: nil, done: false,  order: nil, category: "Arroser", delay: 12, culture: master_ciboulette)
Task.create!(name: "Arroser", description: "arroser pour maintenir la terre humide", date: nil, done: false,  order: nil, category: "Arroser", delay: 14, culture: master_ciboulette)
Task.create!(name: "Arroser", description: "arroser pour maintenir la terre humide", date: nil, done: false,  order: nil, category: "Arroser", delay: 20, culture: master_ciboulette)
Task.create!(name: "Désherber", description: "arracher les mauvaises herbes autour des tiges de ciboulette pour éviter la concurrence", date: nil, done: false,  order: nil, category: "Arroser", delay: 3, culture: master_ciboulette)
Task.create!(name: "Désherber", description: "arracher les mauvaises herbes autour des tiges de ciboulette pour éviter la concurrence", date: nil, done: false,  order: nil, category: "Protéger", delay: 20, culture: master_ciboulette)
Task.create!(name: "Arroser", description: "arroser pour maintenir la terre humide", date: nil, done: false,  order: nil, category: "Arroser", delay: 25, culture: master_ciboulette)
Task.create!(name: "Désherber", description: "arracher les mauvaises herbes autour des tiges de ciboulette pour éviter la concurrence", date: nil, done: false,  order: nil, category: "Protéger", delay: 25, culture: master_ciboulette)
Task.create!(name: "Désherber", description: "arracher les mauvaises herbes autour des tiges de ciboulette pour éviter la concurrence", date: nil, done: false,  order: nil, category: "Protéger", delay: 30, culture: master_ciboulette)
Task.create!(name: "Tailler", description: "couper les fleurs pour favoriser la croissance des tiges", date: nil, done: false,  order: nil, category: "Tailler", delay: 30, culture: master_ciboulette)
Task.create!(name: "Arroser", description: "arroser pour maintenir la terre humide", date: nil, done: false,  order: nil, category: "Arroser", delay: 30, culture: master_ciboulette)
Task.create!(name: "Désherber", description: "arracher les mauvaises herbes autour des tiges de ciboulette pour éviter la concurrence", date: nil, done: false,  order: nil, category: "Protéger", delay: 35, culture: master_ciboulette)
Task.create!(name: "Tailler", description: "couper les fleurs pour favoriser la croissance des tiges", date: nil, done: false,  order: nil, category: "Tailler", delay: 35, culture: master_ciboulette)
Task.create!(name: "Arroser", description: "arroser pour maintenir la terre humide", date: nil, done: false,  order: nil, category: "Arroser", delay: 35, culture: master_ciboulette)
Task.create!(name: "Désherber", description: "arracher les mauvaises herbes autour des tiges de ciboulette pour éviter la concurrence", date: nil, done: false,  order: nil, category: "Protéger", delay: 40, culture: master_ciboulette)
Task.create!(name: "Récolter", description: "couper les tiges à 15 cm de hauteur, seulement la moitié des tiges à la fois", date: nil, done: false,  order: nil, category: "Récolter", delay: 40, culture: master_ciboulette)
Task.create!(name: "Arroser", description: "arroser pour maintenir la terre humide", date: nil, done: false,  order: nil, category: "Arroser", delay: 40, culture: master_ciboulette)
Task.create!(name: "Tailler", description: "couper les fleurs pour favoriser la croissance des tiges", date: nil, done: false,  order: nil, category: "Tailler", delay: 45, culture: master_ciboulette)
Task.create!(name: "Arroser", description: "arroser pour maintenir la terre humide", date: nil, done: false,  order: nil, category: "Arroser", delay: 45, culture: master_ciboulette)
Task.create!(name: "Récolter", description: "couper les tiges à 15 cm de hauteur, seulement la moitié des tiges à la fois", date: nil, done: false,  order: nil, category: "Récolter", delay: 50, culture: master_ciboulette)
Task.create!(name: "Arroser", description: "arroser pour maintenir la terre humide", date: nil, done: false,  order: nil, category: "Arroser", delay: 50, culture: master_ciboulette)
Task.create!(name: "Récolter", description: "couper les tiges à 15 cm de hauteur, seulement la moitié des tiges à la fois", date: nil, done: false,  order: nil, category: "Récolter", delay: 60, culture: master_ciboulette)
Task.create!(name: "Arroser", description: "arroser pour maintenir la terre humide", date: nil, done: false,  order: nil, category: "Arroser", delay: 60, culture: master_ciboulette)

puts "============= 🌿 Task pour Master Ciboulette crées ! 🌿 ============"
puts "============= 🍅 Task pour Master Tomate 🍅 ============"

Task.create!(name: "Semer", description: "semer au chaud et à la lumière dans des petits pots ou godets avec un engrais spécial semis", date: nil, done: false, order: nil, category: "Planter", delay: 0, culture: master_tomate)
Task.create!(name: "Arroser", description: "arroser généreusement pour que la terre et l'engrais permettent l'enracinement", date: nil, done: false, order: nil, category: "Arroser", delay: 0, culture: master_tomate)
Task.create!(name: "Arroser", description: "arroser pour maintenir la terre humide", date: nil, done: false, order: nil, category: "Arroser", delay: 3, culture: master_tomate)
Task.create!(name: "Arroser", description: "arroser pour maintenir la terre humide", date: nil, done: false, order: nil, category: "Arroser", delay: 6, culture: master_tomate)
Task.create!(name: "Arroser", description: "arroser pour maintenir la terre humide", date: nil, done: false, order: nil, category: "Arroser", delay: 9, culture: master_tomate)
Task.create!(name: "Arroser", description: "arroser pour maintenir la terre humide", date: nil, done: false, order: nil, category: "Arroser", delay: 12, culture: master_tomate)
Task.create!(name: "Repiquer", description: "repiquer les plants dans des petits pots individuels quand les premières feuilles apparaissent", date: nil, done: false, order: nil, category: "Planter", delay: 14, culture: master_tomate)
Task.create!(name: "Arroser", description: "arroser généreusement pour que la terre et l'engrais permettent l'enracinement", date: nil, done: false, order: nil, category: "Arroser", delay: 14, culture: master_tomate)
Task.create!(name: "Arroser", description: "arroser pour maintenir la terre humide", date: nil, done: false, order: nil, category: "Arroser", delay: 20, culture: master_tomate)
Task.create!(name: "Arroser", description: "arroser pour maintenir la terre humide", date: nil, done: false, order: nil, category: "Arroser", delay: 24, culture: master_tomate)
Task.create!(name: "Planter", description: "planter les jeunes plants en pleine terre en les espaçant de 50 cm et à 10 cm de profondeur ou dans un grand pot en terre cuite de 30cm de diamètre", date: nil, done: false, order: nil, category: "Planter", delay: 25, culture: master_tomate)
Task.create!(name: "Arroser", description: "arroser généreusement pour que la terre et l'engrais permettent l'enracinement", date: nil, done: false, order: nil, category: "Arroser", delay: 25, culture: master_tomate)
Task.create!(name: "Installer", description: "planter profondément un bâton de 120 cm à 5 cm du pied de tomate et l'attacher de manière lâche à celui-ci pour le soutenir dans sa croissance", date: nil, done: false, order: nil, category: "Tuteur", delay: 25, culture: master_tomate)
Task.create!(name: "Pailler", description: "recouvrir le pied de tomate de paille sur un diamètre de 20cm pour maintenir l'humidité du sol", date: nil, done: false, order: nil, category: "Protéger", delay: 25, culture: master_tomate)
Task.create!(name: "Arroser", description: "arroser pour maintenir la terre humide sans mouiller les feuilles", date: nil, done: false, order: nil, category: "Arroser", delay: 28, culture: master_tomate)
Task.create!(name: "Tailler", description: "enlever les petites feuilles à l'aisselle des tiges pour permettre la croissance de la tige principale", date: nil, done: false, order: nil, category: "Tailler", delay: 28, culture: master_tomate)
Task.create!(name: "Arroser", description: "arroser pour maintenir la terre humide sans mouiller les feuilles", date: nil, done: false, order: nil, category: "Arroser", delay: 31, culture: master_tomate)
Task.create!(name: "Tailler", description: "enlever les petites feuilles à l'aisselle des tiges pour permettre la croissance de la tige principale", date: nil, done: false, order: nil, category: "Tailler", delay: 35, culture: master_tomate)
Task.create!(name: "Arroser", description: "arroser pour maintenir la terre humide sans mouiller les feuilles", date: nil, done: false, order: nil, category: "Arroser", delay: 35, culture: master_tomate)
Task.create!(name: "Apporter", description: "mettre au pied de la plante de l'engrais liquide enrichi en phosphore pour encourager la fructification", date: nil, done: false, order: nil, category: "Encourager", delay: 40, culture: master_tomate)
Task.create!(name: "Tailler", description: "enlever les petites feuilles à l'aisselle des tiges pour permettre la croissance de la tige principale", date: nil, done: false, order: nil, category: "Tailler", delay: 40, culture: master_tomate)
Task.create!(name: "Arroser", description: "arroser pour maintenir la terre humide sans mouiller les feuilles", date: nil, done: false, order: nil, category: "Arroser", delay: 40, culture: master_tomate)
Task.create!(name: "Apporter", description: "mettre au pied de la plante de l'engrais liquide enrichi en phosphore pour encourager la fructification", date: nil, done: false, order: nil, category: "Encourager", delay: 40, culture: master_tomate)
Task.create!(name: "Tailler", description: "enlever les petites feuilles à l'aisselle des tiges pour permettre la croissance de la tige principale", date: nil, done: false, order: nil, category: "Tailler", delay: 45, culture: master_tomate)
Task.create!(name: "Arroser", description: "arroser pour maintenir la terre humide sans mouiller les feuilles", date: nil, done: false, order: nil, category: "Arroser", delay: 45, culture: master_tomate)
Task.create!(name: "Tailler", description: "enlever les petites feuilles à l'aisselle des tiges pour permettre la croissance de la tige principale", date: nil, done: false, order: nil, category: "Tailler", delay: 50, culture: master_tomate)
Task.create!(name: "Arroser", description: "arroser pour maintenir la terre humide sans mouiller les feuilles", date: nil, done: false, order: nil, category: "Arroser", delay: 50, culture: master_tomate)
Task.create!(name: "Tailler", description: "enlever les petites feuilles à l'aisselle des tiges pour permettre la croissance de la tige principale", date: nil, done: false, order: nil, category: "Tailler", delay: 55, culture: master_tomate)
Task.create!(name: "Arroser", description: "arroser pour maintenir la terre humide sans mouiller les feuilles", date: nil, done: false, order: nil, category: "Arroser", delay: 55, culture: master_tomate)
Task.create!(name: "Tailler", description: "enlever les petites feuilles à l'aisselle des tiges pour permettre la croissance de la tige principale", date: nil, done: false, order: nil, category: "Tailler", delay: 60, culture: master_tomate)
Task.create!(name: "Arroser ", description: "arroser pour maintenir la terre humide sans mouiller les feuilles", date: nil, done: false, order: nil, category: "Arroser", delay: 60, culture: master_tomate)
Task.create!(name: "Tailler", description: "enlever les petites feuilles à l'aisselle des tiges pour permettre la croissance de la tige principale", date: nil, done: false, order: nil, category: "Tailler", delay: 65, culture: master_tomate)
Task.create!(name: "Arroser", description: "arroser pour maintenir la terre humide sans mouiller les feuilles", date: nil, done: false, order: nil, category: "Arroser", delay: 65, culture: master_tomate)
Task.create!(name: "Tailler", description: "enlever les petites feuilles à l'aisselle des tiges pour permettre la croissance de la tige principale", date: nil, done: false, order: nil, category: "Tailler", delay: 70, culture: master_tomate)
Task.create!(name: "Arroser", description: "arroser pour maintenir la terre humide sans mouiller les feuilles", date: nil, done: false, order: nil, category: "Arroser", delay: 70, culture: master_tomate)
Task.create!(name: "Tailler", description: "enlever les petites feuilles à l'aisselle des tiges pour permettre la croissance de la tige principale", date: nil, done: false, order: nil, category: "Tailler", delay: 75, culture: master_tomate)
Task.create!(name: "Arroser", description: "arroser pour maintenir la terre humide sans mouiller les feuilles", date: nil, done: false, order: nil, category: "Arroser", delay: 75, culture: master_tomate)
Task.create!(name: "Tailler", description: "enlever les petites feuilles à l'aisselle des tiges pour permettre la croissance de la tige principale", date: nil, done: false, order: nil, category: "Tailler", delay: 80, culture: master_tomate)
Task.create!(name: "Arroser", description: "arroser pour maintenir la terre humide sans mouiller les feuilles", date: nil, done: false, order: nil, category: "Arroser", delay: 80, culture: master_tomate)
Task.create!(name: "Récolter", description: "récolter les tomates lorsqu'elles sont bien colorées et fermes au toucher", date: nil, done: false, order: nil, category: "Récolter", delay: 80, culture: master_tomate)
Task.create!(name: "Arroser", description: "arroser généreusement", date: nil, done: false, order: nil, category: "Arroser", delay: 90, culture: master_tomate)
Task.create!(name: "Récolter", description: "récolter les tomates lorsqu'elles sont bien colorées et fermes au toucher", date: nil, done: false, order: nil, category: "Récolter", delay: 90, culture: master_tomate)
Task.create!(name: "Tailler", description: "enlever les petites feuilles à l'aisselle des tiges pour permettre la croissance de la tige principale", date: nil, done: false, order: nil, category: "Tailler", delay: 100, culture: master_tomate)
Task.create!(name: "Arroser", description: "arroser généreusement", date: nil, done: false, order: nil, category: "Arroser", delay: 100, culture: master_tomate)
Task.create!(name: "Récolter", description: "récolter les tomates lorsqu'elles sont bien colorées et fermes au toucher", date: nil, done: false, order: nil, category: "Récolter", delay: 100, culture: master_tomate)
Task.create!(name: "Tailler", description: "enlever les petites feuilles à l'aisselle des tiges pour permettre la croissance de la tige principale", date: nil, done: false, order: nil, category: "Tailler", delay: 110, culture: master_tomate)
Task.create!(name: "Récolter", description: "récolter les tomates lorsqu'elles sont bien colorées et fermes au toucher", date: nil, done: false, order: nil, category: "Récolter", delay: 110, culture: master_tomate)
Task.create!(name: "Arracher", description: "arracher le plant qui doit être desséché et sans fruits mûrs", date: nil, done: false, order: nil, category: "Arracher", delay: 120, culture: master_tomate)

puts "============= 🍅 Task pour Master Tomate crées ! 🍅 ============"
puts "============= 🍠 Task pour Master Butternut 🍠 ============"

Task.create!(name: "Semer", description: "semer au chaud et à l'ombre dans des petits pots ou godets avec un engrais spécial semis", date: nil, done: false, order: nil, category: "Planter", delay: 0, culture: master_butternut)
Task.create!(name: "Arroser", description: "arroser généreusement pour que la terre permette la germination", date: nil, done: false, order: nil, category: "Arroser", delay: 0, culture: master_butternut)
Task.create!(name: "Arroser", description: "arroser pour maintenir la terre humide", date: nil, done: false, order: nil, category: "Arroser", delay: 3, culture: master_butternut)
Task.create!(name: "Arroser", description: "arroser pour maintenir la terre humide", date: nil, done: false, order: nil, category: "Arroser", delay: 6, culture: master_butternut)
Task.create!(name: "Arroser", description: "arroser pour maintenir la terre humide", date: nil, done: false, order: nil, category: "Arroser", delay: 9, culture: master_butternut)
Task.create!(name: "Arroser", description: "arroser pour maintenir la terre humide", date: nil, done: false, order: nil, category: "Arroser", delay: 12, culture: master_butternut)
Task.create!(name: "Arroser", description: "arroser pour maintenir la terre humide", date: nil, done: false, order: nil, category: "Arroser", delay: 14, culture: master_butternut)
Task.create!(name: "Arroser", description: "arroser pour maintenir la terre humide", date: nil, done: false, order: nil, category: "Arroser", delay: 20, culture: master_butternut)
Task.create!(name: "Repiquer", description: "planter les jeunes plants en pleine terre en les espaçant de 1,5 à 2m ou dans un grand pot en terre cuite de 50cm de diamètre avec un treillage", date: nil, done: false, order: nil, category: "Planter", delay: 25, culture: master_butternut)
Task.create!(name: "Arroser", description: "arroser généreusement pour que la terre permette le développement", date: nil, done: false, order: nil, category: "Arroser", delay: 25, culture: master_butternut)
Task.create!(name: "Pincer", description: "pincer les tiges au-dessus de la 3ème feuille pour favoriser la fructification", date: nil, done: false, order: nil, category: "Encourager", delay: 30, culture: master_butternut)
Task.create!(name: "Arroser", description: "arroser pour maintenir la terre humide", date: nil, done: false, order: nil, category: "Arroser", delay: 30, culture: master_butternut)
Task.create!(name: "Désherber", description: "arracher les mauvaises herbes autour du pied pour éviter la concurrence", date: nil, done: false, order: nil, category: "Protéger", delay: 30, culture: master_butternut)
Task.create!(name: "Pailler", description: "recouvrir le pied de paille sur un diamètre de 20cm pour maintenir l'humidité du sol", date: nil, done: false, order: nil, category: "Protéger", delay: 30, culture: master_butternut)
Task.create!(name: "Arroser", description: "arroser pour maintenir la terre humide sans mouiller les feuilles", date: nil, done: false, order: nil, category: "Arroser", delay: 35, culture: master_butternut)
Task.create!(name: "Désherber", description: "arracher les mauvaises herbes autour du pied pour éviter la concurrence", date: nil, done: false, order: nil, category: "Protéger", delay: 35, culture: master_butternut)
Task.create!(name: "Arroser", description: "arroser pour maintenir la terre humide sans mouiller les feuilles", date: nil, done: false, order: nil, category: "Arroser", delay: 40, culture: master_butternut)
Task.create!(name: "Désherber", description: "arracher les mauvaises herbes autour du pied pour éviter la concurrence", date: nil, done: false, order: nil, category: "Protéger", delay: 40, culture: master_butternut)
Task.create!(name: "Arroser", description: "arroser pour maintenir la terre humide sans mouiller les feuilles", date: nil, done: false, order: nil, category: "Arroser", delay: 45, culture: master_butternut)
Task.create!(name: "Désherber", description: "arracher les mauvaises herbes autour du pied pour éviter la concurrence", date: nil, done: false, order: nil, category: "Protéger", delay: 45, culture: master_butternut)
Task.create!(name: "Arroser", description: "arroser pour maintenir la terre humide sans mouiller les feuilles", date: nil, done: false, order: nil, category: "Arroser", delay: 50, culture: master_butternut)
Task.create!(name: "Désherber", description: "arracher les mauvaises herbes autour du pied pour éviter la concurrence", date: nil, done: false, order: nil, category: "Protéger", delay: 50, culture: master_butternut)
Task.create!(name: "Arroser", description: "arroser pour maintenir la terre humide sans mouiller les feuilles", date: nil, done: false, order: nil, category: "Arroser", delay: 55, culture: master_butternut)
Task.create!(name: "Désherber", description: "arracher les mauvaises herbes autour du pied pour éviter la concurrence", date: nil, done: false, order: nil, category: "Protéger", delay: 55, culture: master_butternut)
Task.create!(name: "Arroser", description: "arroser pour maintenir la terre humide sans mouiller les feuilles", date: nil, done: false, order: nil, category: "Arroser", delay: 60, culture: master_butternut)
Task.create!(name: "Désherber", description: "arracher les mauvaises herbes autour du pied pour éviter la concurrence", date: nil, done: false, order: nil, category: "Protéger", delay: 60, culture: master_butternut)
Task.create!(name: "Pailler", description: "recouvrir le pied de paille sur un diamètre de 20cm pour maintenir l'humidité du sol", date: nil, done: false, order: nil, category: "Protéger", delay: 60, culture: master_butternut)
Task.create!(name: "Arroser", description: "arroser pour maintenir la terre humide sans mouiller les feuilles", date: nil, done: false, order: nil, category: "Arroser", delay: 65, culture: master_butternut)
Task.create!(name: "Désherber", description: "arracher les mauvaises herbes autour du pied pour éviter la concurrence", date: nil, done: false, order: nil, category: "Protéger", delay: 65, culture: master_butternut)
Task.create!(name: "Arroser", description: "arroser pour maintenir la terre humide sans mouiller les feuilles", date: nil, done: false, order: nil, category: "Arroser", delay: 70, culture: master_butternut)
Task.create!(name: "Désherber", description: "arracher les mauvaises herbes autour du pied pour éviter la concurrence", date: nil, done: false, order: nil, category: "Protéger", delay: 70, culture: master_butternut)
Task.create!(name: "Arroser", description: "arroser pour maintenir la terre humide sans mouiller les feuilles", date: nil, done: false, order: nil, category: "Arroser", delay: 75, culture: master_butternut)
Task.create!(name: "Désherber", description: "arracher les mauvaises herbes autour du pied pour éviter la concurrence", date: nil, done: false, order: nil, category: "Protéger", delay: 75, culture: master_butternut)
Task.create!(name: "Arroser", description: "arroser pour maintenir la terre humide sans mouiller les feuilles", date: nil, done: false, order: nil, category: "Arroser", delay: 80, culture: master_butternut)
Task.create!(name: "Désherber", description: "arracher les mauvaises herbes autour du pied pour éviter la concurrence", date: nil, done: false, order: nil, category: "Protéger", delay: 80, culture: master_butternut)
Task.create!(name: "Arroser", description: "arroser pour maintenir la terre humide sans mouiller les feuilles", date: nil, done: false, order: nil, category: "Arroser", delay: 85, culture: master_butternut)
Task.create!(name: "Désherber", description: "arracher les mauvaises herbes autour du pied pour éviter la concurrence", date: nil, done: false, order: nil, category: "Protéger", delay: 85, culture: master_butternut)
Task.create!(name: "Arroser", description: "arroser pour maintenir la terre humide sans mouiller les feuilles", date: nil, done: false, order: nil, category: "Arroser", delay: 90, culture: master_butternut)
Task.create!(name: "Désherber", description: "arracher les mauvaises herbes autour du pied pour éviter la concurrence", date: nil, done: false, order: nil, category: "Protéger", delay: 90, culture: master_butternut)
Task.create!(name: "Arroser", description: "arroser pour maintenir la terre humide sans mouiller les feuilles", date: nil, done: false, order: nil, category: "Arroser", delay: 95, culture: master_butternut)
Task.create!(name: "Pailler", description: "recouvrir le pied de paille sur un diamètre de 20cm pour maintenir l'humidité du sol", date: nil, done: false, order: nil, category: "Protéger", delay: 95, culture: master_butternut)
Task.create!(name: "Arroser", description: "arroser pour maintenir la terre humide sans mouiller les feuilles", date: nil, done: false, order: nil, category: "Arroser", delay: 100, culture: master_butternut)
Task.create!(name: "Désherber", description: "arracher les mauvaises herbes autour du pied pour éviter la concurrence", date: nil, done: false, order: nil, category: "Protéger", delay: 100, culture: master_butternut)
Task.create!(name: "Arroser", description: "arroser pour maintenir la terre humide sans mouiller les feuilles", date: nil, done: false, order: nil, category: "Arroser", delay: 105, culture: master_butternut)
Task.create!(name: "Désherber", description: "arracher les mauvaises herbes autour du pied pour éviter la concurrence", date: nil, done: false, order: nil, category: "Protéger", delay: 105, culture: master_butternut)
Task.create!(name: "Arroser", description: "arroser pour maintenir la terre humide sans mouiller les feuilles", date: nil, done: false, order: nil, category: "Arroser", delay: 110, culture: master_butternut)
Task.create!(name: "Désherber", description: "arracher les mauvaises herbes autour du pied pour éviter la concurrence", date: nil, done: false, order: nil, category: "Protéger", delay: 110, culture: master_butternut)
Task.create!(name: "Arroser", description: "arroser pour maintenir la terre humide sans mouiller les feuilles", date: nil, done: false, order: nil, category: "Arroser", delay: 115, culture: master_butternut)
Task.create!(name: "Désherber", description: "arracher les mauvaises herbes autour du pied pour éviter la concurrence", date: nil, done: false, order: nil, category: "Protéger", delay: 115, culture: master_butternut)
Task.create!(name: "Récolter", description: "récolter les butternuts lorsqu'elles sont uniformément beiges et que le pédoncule commence à sécher", date: nil, done: false, order: nil, category: "Récolter", delay: 120, culture: master_butternut)
Task.create!(name: "Arroser", description: "arroser pour maintenir la terre humide sans mouiller les feuilles", date: nil, done: false, order: nil, category: "Arroser", delay: 120, culture: master_butternut)
Task.create!(name: "Désherber", description: "arracher les mauvaises herbes autour du pied pour éviter la concurrence", date: nil, done: false, order: nil, category: "Protéger", delay: 120, culture: master_butternut)
Task.create!(name: "Récolter", description: "récolter les butternuts lorsqu'elles sont uniformément beiges et que le pédoncule commence à sécher", date: nil, done: false, order: nil, category: "Récolter", delay: 125, culture: master_butternut)
Task.create!(name: "Arroser", description: "arroser pour maintenir la terre humide sans mouiller les feuilles", date: nil, done: false, order: nil, category: "Arroser", delay: 125, culture: master_butternut)
Task.create!(name: "Récolter", description: "récolter les butternuts lorsqu'elles sont uniformément beiges et que le pédoncule commence à sécher", date: nil, done: false, order: nil, category: "Récolter", delay: 130, culture: master_butternut)
Task.create!(name: "Arroser", description: "arroser pour maintenir la terre humide sans mouiller les feuilles", date: nil, done: false, order: nil, category: "Arroser", delay: 140, culture: master_butternut)
Task.create!(name: "Désherber", description: "arracher les mauvaises herbes autour du pied pour éviter la concurrence", date: nil, done: false, order: nil, category: "Protéger", delay: 150, culture: master_butternut)
Task.create!(name: "Récolter", description: "récolter les butternuts lorsqu'elles sont uniformément beiges et que le pédoncule commence à sécher", date: nil, done: false, order: nil, category: "Récolter", delay: 160, culture: master_butternut)
Task.create!(name: "Arracher", description: "arracher le plant qui doit être desséché et sans fruits mûrs", date: nil, done: false, order: nil, category: "Arracher", delay: 160, culture: master_butternut)

puts "============= 🍠 Task pour Master Butternut crées ! 🍠 ============"
puts "========== 🪄 #{Task.count} Tasks crées 🪄 ===================="

puts "========== 🌹🌺🪻 Seeding terminé 🪻🌺🌹 ==========="
