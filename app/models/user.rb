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
      icon = meteo['weather'].first['icon']
      {temp: meteo['main']['temp'].round(1), icon: "https://openweathermap.org/img/w/#{icon}.png", city: meteo['name']}
    else
      return "Indisponible"
    end
  end

end
