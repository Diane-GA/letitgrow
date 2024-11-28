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

# culture.photo.attach(io: URI.open(data[:photo]), filename: "#{data[:name].parameterize}.jpg", content_type: "image/jpeg")
puts "========== 🔮 #{Culture.count} Cultures crée 🔮 ==================="

puts "========== 🪄 Créations des Tasks 🪄 ==============="


puts "========== 🪄 #{Task.count} Tasks crées 🪄 ===================="

puts "========== 🌹🌺🪻 Seeding terminé 🪻🌺🌹 ==========="
