require "faker"


def random_social_security_number
  1225697227266278 + Random.rand(97656784553452)
end

def random_siret
  122569722726627 + Random.rand(97656784553452)
end


positions = ["Barman", "waiter", "Cook", "Receptionist", "Commis", "Second in command", "Desk Clerk", "Washer up"]
min_wages =  [800, 900, 1000, 1100, 1200, 1500]
cities = ["Paris", "Versailles", "Montreuil", "Clamart", "Cergy", "Nanterre"]
user_mobility = [2, 5, 10, 25, 50]
facility_size = ["<9", "10-49", "50-199", "200+"]
facility_categories = ["Hotel 1-2-3 *", "Hotel 4-5 *", "Evenementiel", "Restaurantion Gastronomique", "traiteur", "Brasserie", "Bar", "Restauration Rapide", "Camping", "Discothèque"]


50.times do |num|
  user = User.new(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    birth_date: Faker::Date.between(50.years.ago, 20.years.ago),
    description: Faker::Lorem.sentence,
    position: positions.sample,
    min_wage: min_wages.sample,
    address: cities.sample,
    email: "#{num.next}@extra.com",
    password: "hellohello",
    password_confirmation: "hellohello",
    mobility_radius: user_mobility.sample,
    telephone: Faker::PhoneNumber.phone_number,
    on_duty: true,
    social_security_number: random_social_security_number
  )
  user.save!
end

10.times do |num|
  employer = User.new(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    birth_date: Faker::Date.between(50.years.ago, 40.years.ago),
    description: Faker::Lorem.sentence,
    position: "Business owner",
    email: "#{num.next}@boss.com",
    password: "hellohello",
    password_confirmation: "hellohello",
    min_wage: nil,
    address: cities.sample,
    mobility_radius: nil,
    on_duty: false,
    social_security_number: random_social_security_number
  )
  employer.save!
    facility = Facility.new(
      name: Faker::Company.name,
      siret: random_siret,
      creation_date: Faker::Date.between(40.years.ago, 20.years.ago),
      address: cities.sample,
      size: facility_size.sample,
      category: facility_categories.sample,
      website_url: Faker::Internet.url,
      description: Faker::Company.catch_phrase,
      user: employer
    )
    facility.save!
end


