class JobRequest < ActiveRecord::Base
  #POSITIONS = []

  belongs_to :facility
  has_many :bookings

  validates :staff_size, numericality: { only_integer: true, greater_than_or_equal_to: 1 }
  validates_datetime :start_time, after: lambda { Time.now }, after_message: 'must be in the future'
  validates_datetime :end_time, after: :start_time
  #2do validates :facility, presence: true
  validates :max_price, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validates :position, presence: true

  # t.integer :staff_size
  # t.string :position
  # t.datetime :start_time
  # t.datetime :end_time
  # t.integer :max_price
  # t.references :facility, index: true, foreign_key: true
end
