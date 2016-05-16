class Facility < ActiveRecord::Base
  belongs_to :user
  has_many :bookings
  has_many :job_requests

      # t.string :name
      # t.string :siret
      # t.date :creation_date
      # t.string :address
      # t.string :size
      # t.string :category
      # t.string :website_url
      # t.text :description
      # t.references :user, index: true, foreign_key: true
end
