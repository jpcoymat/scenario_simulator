class Product < ApplicationRecord

  belongs_to :organization
  validate :code, uniqueness: {scope: :organization_id}
  

end
