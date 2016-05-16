class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :bookings
  has_many :facilities

  validates :first_name, :last_name, presence: true #:birth_date, :birth_place, :address, :position, presence: true
  validates :min_wage, numericality: { greater_than_or_equal_to: 750 } # SMIC horaire 2016
  # validates :birth_date,

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
end
