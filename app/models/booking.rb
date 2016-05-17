class Booking < ActiveRecord::Base
  belongs_to :facility
  belongs_to :job_request
  belongs_to :user

  validates :facility, :job_request, :user, presence: true
  validates :final_price, numericality: { only_integer: true, greater_than: 0 }
  enum status: [:pending, :rejected, :cancelled, :accepted, :done]
  # 2do: improve validation of final price when the booking is positve

  # t.integer :status
  # t.integer :final_price
  # t.references :facility, index: true, foreign_key: true
  # t.references :job_request, index: true, foreign_key: true
  # t.references :user, index: true, foreign_key: true
end
