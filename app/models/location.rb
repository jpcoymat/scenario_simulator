class Location < ApplicationRecord

  belongs_to :organization
  validates :code, uniqueness: {scope: :organization_id}

end
