class Location < ApplicationRecord
  belongs_to :user
  has_many :availabilities, dependent: :destroy
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
  mount_uploader :photo, PhotoUploader

  include PgSearch
  pg_search_scope :search_for_location,
    against: [ :name, :location_type, :occasion, :address ],
    associated_against: {
      availabilities: [ :date ]
    },
    using: {
      tsearch: { prefix: true }
    }
end
