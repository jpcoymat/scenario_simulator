class Organization < ApplicationRecord
  
  has_many :products, dependent: :destroy
  has_many :locations, dependent: :destroy
  
  def network
    OrganizationLink.where(focal_organization_id: self.id).all
  end
  
end
