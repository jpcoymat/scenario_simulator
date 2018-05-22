class UnifiedOrderService

  def initialize(order)
    @enterprise_org = order.enterprise_organization
    @order_number = order.reference_number
    @buyer_org = order.customer_organization
    @seller_org = order.supplier_organization
    @carrier_org = order.carrier_organization
    @logistics_org = order.logistics_organization
    @product = order.product
    @origin_location = order.origin_location
    @destination_location = order.destination_location
    @eta = order.eta
    @etd = order.etd
    @mode = order.transportation_mode.try(:mode_code )     
    @quantity = order.quantity
  end

  def generate_unified_order
    unified_order = nil
    uo_params = {
      product_code: @product.code,
      origin_location: @origin_location.try(:code),
      destination_location: @destination_location.try(:code),
      order_number: @order_number,
      buyer: @buyer_org.large_id,
      eta: @eta,
      etd: @etd,
      division_id: @enterprise_org.division_id,
      seller_id:  @seller_org.large_id,
      logistics_provider: @logistics_org.try(:large_id),
      carrier: @carrier_org.try(:large_id),
      unit_weight: @product.unit_weight,
      unit_price: @product.unit_price,
      mode: @mode,
      quantity: @quantity
    }
    if @enterprise_org == @buyer_org 
      uo_params[:order_class] = @enterprise_org.supply_order_class
      unified_order = InboundUnifiedOrder.new(uo_params)
    else
      uo_params[:order_class] = @enterprise_org.demand_order_class
      unified_order = OutboundUnifiedOrder.new(uo_params)
    end
    unified_order
  end



end
