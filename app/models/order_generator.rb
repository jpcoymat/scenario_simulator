class OrderGenerator

  attr_accessor :product
  attr_accessor :origin_location
  attr_accessor :destination_location
  attr_accessor :enterprise_organization
  attr_accessor :counterpart_organization
  attr_accessor :logistics_provider_organization
  attr_accessor :carrier_organization
  attr_accessor :eta
  attr_accessor :etd
  attr_accessor :quantity
  attr_accessor :mode

  def initialize(params = {})
    params.each {|k,v| instance_variable_set("@#{k}", v)}
  end
    
  def inbound_order
    @inbound_order = InboundUnifiedOrder.new(
    product_code: @product.try(:code),
    origin_location: @origin_location.try(:code),
    destination_location:  @destination_location.try(:code),
    buyer: @enterprise_organization.try(:large_id),
    eta: @eta,
    etd: @etd,
    division_id: @enterprise_organization.try(:division_id),
    seller_id: @counterpart_organization.try(:large_id),
    logistics_provider: @logistics_provider_organization.try(:large_id),
    carrier: @carrier_organization.try(:large_id),
    unit_weight: @product.try(:unit_weight),
    unit_price: @product.tr(:unit_price),
    quantity: @quantity,
    mode: @mode,
    order_class: @enterprise_organization.try(:supply_order_class)
    )
  end
  
  def outbound_order
    @outound_order = OutboundUnifiedOrder.new(
    product_code: @product.try(:code),
    origin_location: @origin_location.try(:code),
    destination_location:  @destination_location.try(:code),
    buyer: @counterpart_organization.try(:large_id),
    eta: @eta,
    etd: @etd,
    division_id: @enterprise_organization.try(:division_id),
    seller_id: @enterprise_organization.try(:large_id),
    logistics_provider: @logistics_provider_organization.try(:large_id),
    carrier: @carrier_organization.try(:large_id),
    unit_weight: @product.try(:unit_weight),
    unit_price: @product.tr(:unit_price),
    quantity: @quantity,
    mode: @mode,
    order_class: @enterprise_organization.try(:demand_order_class)
    )
  end
  

end
