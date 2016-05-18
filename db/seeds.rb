require "faker"
require 'json'
require 'open-uri'

# Clear db
Facility.destroy_all
User.destroy_all

def generate_social_security_number(birth_date)
  sid = %w(1 2).sample \
    + (birth_date.year % 100).to_s \
    + (birth_date.month).to_s \
    + "%2d" % (1 + rand(95)) \
    + "%3d" % rand(1000) \
    + "%3d" % rand(1000)
  sid += "%2d" % (97 - (sid[0..12].to_i % 97))
end

def generate_siret
  siret = (1 + rand(9)).to_s + ('0'..'9').to_a.sample * 8 + '0' * 3 + '18'
end

positions = ["Barman", "Waiter", "Cook", "Receptionist", "Commis", "Second in command", "Desk Clerk", "Washer up"]
min_wages =  [800, 900, 1000, 1100, 1200, 1500]
cities = ["Paris", "Versailles", "Montreuil", "Clamart", "Cergy", "Nanterre"]
user_mobility = [2, 5, 10, 25, 50]
facility_categories = ["Hotel 1-2-3 *", "Hotel 4-5 *", "Evenementiel", "Restaurantion Gastronomique", "traiteur", "Brasserie", "Bar", "Restauration Rapide", "Camping", "Discothèque"]
company_sizes = ['1', '2 - 9', '10 - 49', '50 - 199', '200+']

cities.each do |city|
  positions.each do |position|
    (2 + rand(4)).times do
      api_url = 'http://uifaces.com/api/v1/random'
      photo_url = ''
      open(api_url) do |stream|
        hash = JSON.parse(stream.read)
        photo_url = hash['image_urls']['epic']
      end
      first_name = Faker::Name.first_name
      last_name = Faker::Name.last_name
      birth_date = Faker::Date.between(50.years.ago, 16.years.ago)
      User.create(
        first_name: first_name,
        last_name: last_name,
        birth_date: birth_date,
        description: Faker::Lorem.paragraphs.join,
        position: position,
        min_wage: min_wages.sample,
        address: city,
        email: "#{first_name}.#{last_name}.extra@daily.com",
        password: "instantdaily",
        password_confirmation: "instantdaily",
        mobility_radius: user_mobility.sample,
        telephone: Faker::PhoneNumber.phone_number,
        on_duty: true,
        social_security_number: generate_social_security_number(birth_date),
        photo: photo_url
      )
    end
  end
end

# facilities
cities.each do |city|
  (2 + rand(3)).times do
    api_url = 'http://uifaces.com/api/v1/random'
    photo_url = ''
    open(api_url) do |stream|
      hash = JSON.parse(stream.read)
      photo_url = hash['image_urls']['epic']
    end

    first_name = Faker::Name.first_name
    last_name = Faker::Name.last_name

    employer = User.create(
      first_name: first_name,
      last_name: last_name,
      position: "Business owner",
      email: "#{first_name}.#{last_name}.boss@instantdaily.com",
      password: "instantdaily",
      password_confirmation: "instantdaily",
      min_wage: nil,
      address: city,
      mobility_radius: nil,
      on_duty: false,
      photo: photo_url
    )
    facility = Facility.create(
      name: Faker::Company.name,
      siret: generate_siret,
      creation_date: Faker::Date.between(40.years.ago, 20.years.ago),
      address: city,
      size: company_sizes.sample,
      category: facility_categories.sample,
      website_url: Faker::Internet.url,
      description: Faker::Lorem.paragraphs.join,
      user: employer,
      photo: ""
    )
  end
end
