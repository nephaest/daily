


# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require "faker"

def random_social_security_number
  1225697227266278 + Random.rand(97656784553452)
end

def random_siret
  122569722726627 + Random.rand(97656784553452)
end


positions = ["Barman", "waiter", "Cook", "Receptionist", "Commis", "Second in command", "Desk Clerk", "Washer up"]
min_wages =  [800, 900, 1000, 1100, 1200]
cities = ["Paris", "Versailles", "Montreuil", "Clamart", "Cergy", "Nanterre"]
user_mobility = [2, 5, 10, 25, 50]
facility_size = ["<9", "10-49", "50-200", "200+"]
facility_categories = ["Hotel 1-2-3 *", "Hotel 4-5 *", "Evenementiel" "Restaurantion Gastronomique", "traiteur", "Brasserie", "Bar", "Restauration Rapide", "Camping", "Discothèque"]


30.times do |num|
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
    on_duty: nil,
    social_security_number: random_social_security_number
  )
    employer.save!
    facility = Facility.new(
    name: Faker::Company.name,
    siret: siret.random_siret,
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


# t.string :name
# t.string :siret
# t.date :creation_date
# t.string :address
# t.string :size
# t.string :category
# t.string :website_url
# t.text :description
# t.references :user, index: true, foreign_key: true

# t.string :first_name
# t.string :last_name
# t.date :birth_date
# t.string :birth_place
# t.text :description
# t.string :position
# t.integer :min_wage
# t.string :address
# t.integer :mobility_radius
# t.boolean :on_duty
# t.string :social_security_number
