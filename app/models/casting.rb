require "open-uri"
class Casting < ApplicationRecord
  before_validation :geocode_addr

  def geocode_addr
    if addr.present?
      url = "https://maps.googleapis.com/maps/api/geocode/json?key=#{ENV['GMAP_API_KEY']}&address=#{URI.encode(addr)}"

      raw_data = open(url).read

      parsed_data = JSON.parse(raw_data)

      if parsed_data["results"].present?
        self.addr_latitude = parsed_data["results"][0]["geometry"]["location"]["lat"]

        self.addr_longitude = parsed_data["results"][0]["geometry"]["location"]["lng"]

        self.addr_formatted_address = parsed_data["results"][0]["formatted_address"]
      end
    end
  end
  mount_uploader :profile, ProfileUploader

  # Direct associations

  belongs_to :actor

  belongs_to :movie

  # Indirect associations

  # Validations

  validates :actor_id, presence: true

  validates :movie_id, presence: true

  # Scopes

  def to_s
    character_name
  end
end
