class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  mount_uploader :photo, PhotoUploader
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # include IceCube
  serialize :availability, IceCube::Schedule

  has_many :bookings
  has_many :facilities, dependent: :destroy

  validates :first_name, :last_name, presence: true #:birth_date, :birth_place, :address, :position, presence: true
  validates :min_wage, numericality: { only_integer: true,  greater_than_or_equal_to: 750, allow_nil: true, message: 'must be greater than 7.5€ net/h' } # SMIC horaire 2016
  # validates_date :birth_date, before: lambda { 16.year.ago }, on: :update
  validates :description,  length: { minimum: 100, maximum: 1000, allow_nil: true }
  validates :mobility_radius, numericality: { only_integer: true,  greater_than_or_equal_to: 0, allow_nil: true }
  # validate :social_security_number_is_valid, on: :update

  def initialize(args = {})
    availability = IceCube::Schedule.new(Date.today) { |s| s.add_recurrence_rule IceCube::Rule.daily }
    super(args)
  end

  def full_name
    "#{first_name} #{last_name}"
  end

  def owner?
    facilities.any?
  end

  #2do: plan to manage the off_duties with rules to make it as user friendly as possible
  def available?(date)
    availability.occurs_at?(date)
  end

  def book(date)
    availability.add_exception_time(date)
  end

  def cancel(date)
    availability.remove_exception_time(date)
  end

  private

  def social_security_number_is_valid
    #2do may add the check between some of the next digits and the birth place
    if social_security_number.nil? && !owner?
      errors.add :social_security_number, 'is mandatory'
    elsif social_security_number.length != 15 \
      || 97 - (social_security_number[0..12].to_i % 97) != social_security_number[13..14].to_i \
      || social_security_number[1..2].to_i != birth_date.year % 100 \
      || social_security_number[3..4].to_i != birth_date.month
      errors.add :social_security_number, 'is invalid'
    end
  end
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
