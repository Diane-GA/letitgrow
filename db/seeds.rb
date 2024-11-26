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

cultures_data = [
  { name: "Pomme de terre", in_ground: true, outdoor: true, user: user, photo: "https://images.unsplash.com/photo-1518977676601-b53f82aba655?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D" },
  { name: "Tomate", in_ground: false, outdoor: true, user: user, photo: "https://images.unsplash.com/photo-1517666005606-69dea9b54865?q=80&w=1776&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D" },
  { name: "Salade", in_ground: true, outdoor: false, user: user, photo: "https://images.unsplash.com/photo-1691906233921-8d62bb44a28f?q=80&w=1974&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D" },
  { name: "Poivron", in_ground: false, outdoor: false, user: user, photo: "https://images.unsplash.com/photo-1669524943640-44a43585ee88?q=80&w=1887&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D" }
]

cultures_data.each do |data|
  culture = Culture.create!(
    **data.except(:photo), # Exclure temporairement :photo pour la création initiale
    plantation_date: Date.today - rand(1..365),
    status: ["Graine", "Premières feuilles", "Petit plan", "Premières fleurs", "Premiers fruits", "Fin de fructification"].sample
  )

  # Attacher l'image Cloudinary via ActiveStorage
  culture.photo.attach(io: URI.open(data[:photo]), filename: "#{data[:name].parameterize}.jpg", content_type: "image/jpeg")
end

puts "========== 🔮 #{Culture.count} Cultures crée 🔮 ==================="

puts "========== 🪄 Créations des Tasks 🪄 ==============="

# Méthode pour créer des tasks pour une culture donnée
def create_tasks_for_culture(culture, count: 4)
  (1..count).each do |i|
    Task.create!(
      name: ["Arroser", "Rempoter", "Transplanter", "Semer"].sample,
      description: "Task pour #{culture.name}",
      date: Date.today + rand(1..30), # Exemples de dates futures aléatoires
      status: ["À faire", "En cours", "Validée"].sample,
      order: i,
      category: ["Entretien", "Plantation", "Récolte"].sample,
      culture: culture
    )
  end
end

# Création des tâches pour chaque culture existante
Culture.all.each do |culture|
  create_tasks_for_culture(culture)
end

puts "========== 🪄 #{Task.count} Tasks crées 🪄 ===================="

puts "========== 🌹🌺🪻 Seeding terminé 🪻🌺🌹 ==========="
