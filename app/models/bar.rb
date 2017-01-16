class Bar < ApplicationRecord
  belongs_to :user
  resourcify

  geocoded_by :address
  after_validation :geocode

  def address
    "#{street}, #{city}, #{state}, #{zip}"
  end
end
