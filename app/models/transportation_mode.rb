class TransportationMode < ApplicationRecord

  validates :mode_code, uniqueness: true
  validates :mode_description, uniqueness: true


end
