class Bar < ApplicationRecord
  validates :name, uniqueness: true
  belongs_to :user
  has_many :events
  # include PgSearch
  # multisearchable :against => [:name, :street, :city, :zip]
  resourcify

  geocoded_by :address
  after_validation :geocode

  def address
    "#{street}, #{city}, #{state}, #{zip}"
  end
end
