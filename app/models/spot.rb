require 'open-uri'
class Spot < ApplicationRecord
  before_validation :geocode_adress

  def geocode_adress
    if self.adress.present?
      url = "http://maps.googleapis.com/maps/api/geocode/json?address=#{URI.encode(self.adress)}"

      raw_data = open(url).read

      parsed_data = JSON.parse(raw_data)

      if parsed_data["results"].present?
        self.adress_latitude = parsed_data["results"][0]["geometry"]["location"]["lat"]

        self.adress_longitude = parsed_data["results"][0]["geometry"]["location"]["lng"]

        self.adress_formatted_address = parsed_data["results"][0]["formatted_address"]
      end
    end
  end
  # Direct associations

  has_many   :photos,
             :dependent => :destroy

  has_many   :comments,
             :dependent => :destroy

  has_many   :sports,
             :dependent => :nullify

  has_many   :likes,
             :dependent => :destroy

  # Indirect associations

  has_many   :users,
             :through => :likes,
             :source => :user

  # Validations

end
