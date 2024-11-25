puts "========== 🪓 Suppression des Tasks 🪓 ============="

Task.delete_all

puts "========== 🔨 Suppression des Cultures 🔨 ============="

Culture.delete_all

puts "========== ⛏️ Suppression des Users ⛏️ ============="

User.delete_all

puts "========== 🪄 Créations des Users 🪄 ============="

user1 = User.create!(email: "diane@gmail.com", password: "123456", username: "Diane", address: "11 rue mauvoisin, 44000, Nantes")
user2 = User.create!(email: "vivien@gmail.com", password: "123456", username: "Vivien", address: "place crousillat, 13300, Salon-de-Provence")
user3 = User.create!(email: "clement@gmail.com", password: "123456", username: "Clement", address: "34 rue du bel-air, 74000, Annecy")
user4 = User.create!(email: "anne-sophie@gmail.com", password: "123456", username: "Anne-sophie", address: "Japon, 〒533-0031 Osaka, Higashiyodogawa Ward, Nishiawaji, 5 Chome−15−10 1F")

puts "========== 🪄 #{User.count} users crées ! 🪄 ============="

puts "========== 🔮 Créations des Cultures 🔮 ============="

status = ["Graine", "Premiéres feuilles", "Petit plan", "Premiére fleurs", "Premiers fruits", "fin de fructification"].sample
culture1 = Culture.create!(name: "Pomme de terre", plantation_date: "", in_ground: true, outdoor: true, status: status, user: user3)
culture2 = Culture.create!(name: "Tomate", plantation_date: "", in_ground: false, outdoor: true, status: status, user: user1)
culture3 = Culture.create!(name: "Salade", plantation_date: "", in_ground: true, outdoor: false, status: status, user: user2)
culture4 = Culture.create!(name: "Poivron", plantation_date: "", in_ground: false, outdoor: false, status: status, user: user4)

puts "========== 🔮 #{Culture.count} Cultures crée 🔮 ============="

puts "========== 🪄 Créations des Tasks 🪄 ============="

name = ["Arroser", "rempoter", "transplanter", "semer"].sample
statustask = ["A faire", "En cours", "Valider"].sample

Task.create!(name: name, description: name, date: "", status: statustask, order: 1, category: "", culture: culture1)
Task.create!(name: name, description: name, date: "", status: statustask, order: 2, category: "", culture: culture1)
Task.create!(name: name, description: name, date: "", status: statustask, order: 3, category: "", culture: culture1)
Task.create!(name: name, description: name, date: "", status: statustask, order: 4, category: "", culture: culture1)

Task.create!(name: name, description: name, date: "", status: statustask, order: 1, category: "", culture: culture2)
Task.create!(name: name, description: name, date: "", status: statustask, order: 2, category: "", culture: culture2)
Task.create!(name: name, description: name, date: "", status: statustask, order: 3, category: "", culture: culture2)
Task.create!(name: name, description: name, date: "", status: statustask, order: 4, category: "", culture: culture2)

Task.create!(name: name, description: name, date: "", status: statustask, order: 1, category: "", culture: culture3)
Task.create!(name: name, description: name, date: "", status: statustask, order: 2, category: "", culture: culture3)
Task.create!(name: name, description: name, date: "", status: statustask, order: 3, category: "", culture: culture3)
Task.create!(name: name, description: name, date: "", status: statustask, order: 4, category: "", culture: culture3)

Task.create!(name: name, description: name, date: "", status: statustask, order: 1, category: "", culture: culture4)
Task.create!(name: name, description: name, date: "", status: statustask, order: 2, category: "", culture: culture4)
Task.create!(name: name, description: name, date: "", status: statustask, order: 3, category: "", culture: culture4)
Task.create!(name: name, description: name, date: "", status: statustask, order: 4, category: "", culture: culture4)

puts "========== 🪄 #{Task.count} Tasks crées 🪄 ============="

puts "========== 🌹🌺🪻 Seeding terminé 🪻🌺🌹 ============="
