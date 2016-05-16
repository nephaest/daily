class Booking < ActiveRecord::Base
  belongs_to :facility
  belongs_to :job_request
  belongs_to :user

      # t.integer :status
      # t.integer :final_price
      # t.references :facility, index: true, foreign_key: true
      # t.references :job_request, index: true, foreign_key: true
      # t.references :user, index: true, foreign_key: true
end
