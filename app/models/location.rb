# == Schema Information
#
# Table name: locations
#
#  id         :integer          not null, primary key
#  address    :string(255)
#  latitude   :float(24)
#  longitude  :float(24)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Location < ActiveRecord::Base
  geocoded_by :address
  after_validation :geocode, if: :address_changed?
end
