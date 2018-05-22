class Scenario < ApplicationRecord

  belongs_to :product
  belongs_to :location


  def enterprise_organization
    @enterprise_organziation = Organization.where(id: self.enterprise_organization_id).first
  end

  def enterprise_organization=(organization)
    self.enterprise_organization_id = organization.id
  end

  def carrier_organization
    @carrier_organization = Organization.where(id: self.carrier_organization_id).first
  end

  def carrier_organization=(organization)
    self.carrier_organization_id = organization.id
  end


  def supplier_organization
    @supplier_organization = Organization.where(id: self.supplier_organization_id).first
  end

  def supplier_organization=(organization)
    self.supplier_organization_id = organization.id
  end

  def customer_organization
    @customer_organization = Organization.where(id: self.customer_organization_id).first
  end

  def customer_organization=(organization)
    self.customer_organization_id = organization.id
  end

  def logistics_organization
    @logistics_organization = Organization.where(id: self.logistics_organization_id).first
  end
  
  def logistics_organization=(organization)
    self.logistics_organization_id = organization.id
  end
 

end
