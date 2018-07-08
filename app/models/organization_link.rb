class OrganizationLink < ApplicationRecord
  
  validates :focal_organization_id, :service_organization_id, :service_function, presence: true
  validates :service_organization_id, uniqueness: {scope: [:focal_organization_id, :service_function]}
  
  enum service_function: {supplier: 0, customer: 1, carrier: 2, logistics_provider: 3, factory: 4}
  
  def focal_organization
    @focal_organization = Organization.where(id: self.focal_organization_id).first
  end

  def service_organization
    @service_organization = Organization.where(id: self.service_organization_id).first
  end

  def focal_organization=(focal_org)
    self.focal_organization_id = focal_org.try(:id)
  end
  
  def service_organization=(service_org)
    self.service_organization_id = service_org.try(:id)
  end

end
