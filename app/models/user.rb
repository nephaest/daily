class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  mount_uploader :photo, PhotoUploader
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :bookings
  has_many :facilities

  validates :first_name, :last_name, presence: true #:birth_date, :birth_place, :address, :position, presence: true
  validates :min_wage, numericality: { only_integer: true,  greater_than_or_equal_to: 750, allow_nil: true, message: 'must be greater than 7.5€ net/h' } # SMIC horaire 2016
  # validates_date :birth_date, before: lambda { 16.year.ago }
  validates :description,  length: { minimum: 100, maximum: 1000, allow_nil: true }
  validates :mobility_radius, numericality: { only_integer: true,  greater_than_or_equal_to: 0, allow_nil: true } # SMIC horaire 2016
  #2do add validation of secu_id
  # validates :social_security_number, length: { is: 15 }
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
