class Facility < ActiveRecord::Base
  belongs_to :user
  has_many :bookings
  has_many :job_requests

  COMPANY_SIZES = ['1', '2 - 9', '10 - 49', '50 - 199', '200+']

  enum size: COMPANY_SIZES
  #2do COMPANY_CATEGORY = []

  validates :user, :name, :address, presence: true

  validates_date :creation_date, presence: true, before: :today, before_message: 'must be in the past'
  validates :website_url, format: { with: /\A(https?:\/\/)?([\da-z\.-]+)\.([a-z\.]{2,6})([\/\w \.-]*)*\/?\z/, message: 'must be a valid url', allow_nil: true }
  validates :description, presence: true, length: { minimum: 100, maximum: 1000 }
  validates :siret, presence: true #2do check format
  
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
