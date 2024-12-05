require 'json'
require "open-uri"

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :cultures
  has_one_attached :photo

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  def meteo
    url = "https://api.openweathermap.org/data/2.5/weather?lat=#{self.latitude}&lon=#{self.longitude}&appid=#{ENV['OPENWEATHER_MAP_API']}&units=metric"
    if latitude =! nil || longitude =! nil
      meteo_serialized = URI.parse(url).read
      meteo = JSON.parse(meteo_serialized)
      puts meteo
      icon = icon_finder(meteo)
      advice = advice_finder(meteo)
      { temp: meteo['main']['temp'].round(0), icon: icon, city: meteo['name'], advice: advice }
    else
      return "Indisponible"
    end
  end

  def icon_finder(meteo)
    if meteo['weather'].first['main'] == "Thunderstorm"
      return "fi fi-ts-thunderstorm"
    elsif meteo['weather'].first['main'] == "Drizzle"
      return "fi fi-tc-cloud-drizzle"
    elsif meteo['weather'].first['main'] == "Rain"
      return "fi fi-tr-cloud-rain"
    elsif meteo['weather'].first['main'] == "Snow"
      return "fi fi-tr-cloud-snow"
    elsif meteo['weather'].first['main'] == "Clouds"
      return "fi fi-tr-clouds"
    elsif meteo['weather'].first['main'] == "Clear"
      return "fi fi-tr-sun"
    elsif meteo['weather'].first['main'] == "Tornado"
      return "fi fi-tr-wind"
    else
      return "fi fi-tr-fog"
    end
  end

  def advice_finder(meteo)
    if meteo['weather'].first['main'] == "Thunderstorm"
      return "Tu jardineras demain !"
    elsif meteo['weather'].first['main'] == "Drizzle"
      return "Pas d'arrosage dehors aujourd'hui !"
    elsif meteo['weather'].first['main'] == "Rain"
      return "Pas d'arrosage dehors aujourd'hui !"
    elsif meteo['weather'].first['main'] == "Snow"
      return "Vérifie que tout est bien protégé dehors !"
    elsif meteo['weather'].first['main'] == "Clouds"
      return "A l'intérieur, mets tes pots près des fenêtres !"
    elsif meteo['weather'].first['main'] == "Clear"
      return "Arrose plus souvent si la terre sèche trop vite !"
    elsif meteo['weather'].first['main'] == "Tornado"
      return "Vérifie que tout est bien tuteuré dehors !"
    else
      return "Pas d'arrosage dehors aujourd'hui !"
    end
  end

end
