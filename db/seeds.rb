# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require "faker"

20.times do
  user = User.new(
    first_name: Faker::Company.name,
    last_name:
    birth_date:
    description:
    position:
    min_wage:
    address:
    mobility_radius:
    on_duty:
    social_security_number:
  )
  user.save
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
