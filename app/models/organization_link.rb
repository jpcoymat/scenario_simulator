class OrganizationLink < ApplicationRecord
  
  validates :focal_organization_id, :service_organization_id, :service_function, presence: true
  validates :service_organization_id, uniqueness: {scope: [:focal_organization_id, :service_function]}
  
  enum service_function: [:supplier, :customer, :carrier, :logistics_provider, :factory]
  
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
  
  def clean_service_function
    self.service_function.humanize.titleize
  end

end
