class JobRequest < ActiveRecord::Base
  belongs_to :facility
  has_many :bookings
      # t.integer :staff_size
      # t.string :position
      # t.datetime :start_time
      # t.datetime :end_time
      # t.integer :max_price
      # t.references :facility, index: true, foreign_key: true
end
