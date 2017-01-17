class Bar < ApplicationRecord
  belongs_to :user
  has_many :events
  resourcify

  geocoded_by :address
  after_validation :geocode

  def address
    "#{street}, #{city}, #{state}, #{zip}"
  end
end
