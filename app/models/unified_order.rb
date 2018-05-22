class UnifiedOrder

  attr_accessor :product_code
  attr_accessor :origin_location
  attr_accessor :destination_location
  attr_accessor :order_number
  attr_accessor :buyer
  attr_accessor :eta
  attr_accessor :etd
  attr_accessor :file_name
  attr_accessor :division_id
  attr_accessor :seller_id
  attr_accessor :program_type
  attr_accessor :brand
  attr_accessor :channel
  attr_accessor :market
  attr_accessor :logistics_provider
  attr_accessor :carrier
  attr_accessor :unit_weight
  attr_accessor :unit_price
  attr_accessor :quantity
  attr_accessor :event_code
  attr_accessor :mode 
  attr_accessor :order_class


  def initialize(params ={})
    params.each {|k,v| instance_variable_set("@#{k}", v)}
    generate_order_number if @order_number.nil?
    generate_quantity if @quantity.nil?
    @mode = "S" if @mode.nil?
    #@brand = random_brand if @brand.nil?
    #@program_type = random_program_type if @program_type.nil?
    #@channel = random_channel if @channel.nil?
    #@market = random_market if @market.nil? 
    @file_name = @order_number + ".xml"
  end

  def generate_quantity
    @quantity = 100 + Random.rand(100)
  end 


  def generate_order_number
    @order_number = "ORD" + Random.rand(1000000).to_s.rjust(8,'0')
  end

  def generate_file_name
    @file_name = "UO_" + (@buyer || "" ) + "_" + Date.today.to_s + "_" + Random.rand(10000000).to_s.rjust(8,'0') + ".xml"
  end

  def header_xml
    xml_string = %{
  <header>
    <version>310</version>
    <documentType>Order</documentType>
    <messageId>#{Random.rand(1000000).to_s.rjust(8,'0')}</messageId>
    <count>1</count>
  </header> }
   return xml_string
  end

  def order_terms_xml
    issue_date = Date.today
    cancel_date = issue_date + 90.days
    xml_string = %{
    <orderTerms>
      <orderDate>
        <orderDateTypeCode>Issue</orderDateTypeCode>
        <orderDateValue>#{issue_date.to_s}</orderDateValue>
      </orderDate>
      <orderDate>
        <orderDateTypeCode>CancelAfter</orderDateTypeCode>
        <orderDateValue>#{cancel_date.to_s}</orderDateValue>
      </orderDate>
      <orderDate>
        <orderDateTypeCode>Latest</orderDateTypeCode>
        <orderDateValue>#{@eta.to_s}</orderDateValue>
      </orderDate>
      <orderDate>
        <orderDateTypeCode>Earliest</orderDateTypeCode>
        <orderDateValue>#{@etd.to_s}</orderDateValue>
      </orderDate>
      <currencyCode>USD</currencyCode>
      <incotermCode>FOB</incotermCode>
      <incotermLocationCode>THBKK</incotermLocationCode>
      <isPartialShipmentAllowed>true</isPartialShipmentAllowed>
      <shipmentMethodCode>#{@mode}</shipmentMethodCode>
      <isTransShipmentAllowed>true</isTransShipmentAllowed>
      <freightPaymentCode>CC</freightPaymentCode>
      <reference>
        <type>isUnified</type>
        <value>True</value>
      </reference>}
    if @program_type         
      xml_string += %{
      <reference>
        <type>programType</type>
        <value>#{@program_type}</value>
      </reference>}
    end
    if @brand
      xml_string += %{
      <reference>
        <type>Brand Desc</type>
        <value>#{@brand}</value>
      </reference>}
    end
    if @channel
      xml_string += %{
      <reference>
        <type>Channel Desc</type>
        <value>#{@channel}</value>
      </reference>}
    end
    if @market
      xml_string += %{
      <reference>
        <type>Market Desc</type>
        <value>#{@market}</value>
      </reference>}
    end
     xml_string += "</orderTerms>"
    return xml_string
  end
  
  def party_xml
    xml_string = %{
    <party>
      <partyRoleCode>Buyer</partyRoleCode>
      <memberId>#{@buyer}</memberId>
      <divisionUid>#{@division_id}</divisionUid>
    </party>
    <party>
      <partyRoleCode>Seller</partyRoleCode>
      <memberId>#{@seller_id}</memberId>
    </party>
    <party>
      <partyRoleCode>Carrier</partyRoleCode>
      <memberId>#{@carrier}</memberId>
    </party>
    <party>
      <partyRoleCode>LogisticsProvider</partyRoleCode>
      <memberId>#{@logistics_provider}</memberId>
    </party>
    <party>
      <partyRoleCode>ShipmentDestination</partyRoleCode>
      <name>#{@destination_location}</name>
      <address>
        <addressLine1>75 maiden Lane</addressLine1>
        <city>New York</city>
        <stateOrProvince>NY</stateOrProvince>
        <postalCodeNumber>10038</postalCodeNumber>
        <countryCode>US</countryCode>
      </address>      
    </party>}
    return xml_string
  end

  def order_detail_xml
    xml_string = %{
    <subMessageId>1</subMessageId>
    <poNumber>#{@order_number}</poNumber>
    <orderClassType>#{@order_class}</orderClassType>
    <priorityType>Standard</priorityType>
    <orderStatusCode>Open</orderStatusCode>
    <orderFunctionCode>Create</orderFunctionCode>
    <isFirstSaleElibigle>true</isFirstSaleElibigle>  }
    return xml_string
  end


  def as_xml
    xml_string = %{<?xml version="1.0" encoding="utf-8"?>
<Order>}
    xml_string += header_xml
    xml_string += %{
  <orderDetail>} 
    xml_string += order_detail_xml
    xml_string += order_terms_xml
    xml_string += party_xml
    xml_string += order_item_xml
     xml_string += %{
  </orderDetail>
</Order>}
  end

  def order_item_xml
    xml_string = %{
    <orderItem>
      <itemKey>0001</itemKey> }
    xml_string += base_item_xml
    xml_string += %{
      <itemPrice>
        <pricePerUnit>#{@unit_price}</pricePerUnit>
        <totalPrice>#{(@unit_price*@quantity).to_s}</totalPrice>
      </itemPrice>
      <originLocation>
        <name>#{@origin_location}</name>
      </originLocation>
      <destinationLocation>
        <name>#{@destination_location}</name>
      </destinationLocation>
      <productEventType>#{@event_code}</productEventType>
    </orderItem>}
  end


  def base_item_xml
    xml_string = %{
      <baseItem>
        <itemTypeCode>Main</itemTypeCode> 
        <itemIdentifier>
          <itemIdentifierTypeCode>ItemSequenceNumber</itemIdentifierTypeCode>
          <itemIdentifierValue>0001</itemIdentifierValue>
        </itemIdentifier>
        <itemIdentifier>
          <itemIdentifierTypeCode>BuyerNumber</itemIdentifierTypeCode>
          <itemIdentifierValue>#{@product_code}</itemIdentifierValue>
        </itemIdentifier>
        <itemIdentifier>
          <itemIdentifierTypeCode>UpcNumber</itemIdentifierTypeCode>
          <itemIdentifierValue>48898111029</itemIdentifierValue>
        </itemIdentifier>
        <quantity>#{@quantity}</quantity>
        <unitOfMeasureCode>EA</unitOfMeasureCode>
        <itemDate>
          <itemDateTypeCode>PromisedDelivery</itemDateTypeCode>
          <itemDateValue>#{@eta.to_s + "T12:00:00Z"}</itemDateValue>   
        </itemDate>
        <itemDate>
          <itemDateTypeCode>EarliestDate</itemDateTypeCode>
          <itemDateValue>#{@etd.to_s + "T12:00:00Z"}</itemDateValue>
        </itemDate>
        <itemDate>
          <itemDateTypeCode>LatestDate</itemDateTypeCode>
          <itemDateValue>#{@eta.to_s + "T12:00:00Z"}</itemDateValue>
        </itemDate>
        <itemDate>
          <itemDateTypeCode>DeliveryWindowStart</itemDateTypeCode>
          <itemDateValue>#{@etd.to_s + "T12:00:00Z"}</itemDateValue>
        </itemDate>
        <itemDate>
          <itemDateTypeCode>DeliveryWindowEnd</itemDateTypeCode>
          <itemDateValue>#{@eta.to_s + "T12:00:00Z"}</itemDateValue>
        </itemDate>
        <shipmentMethodCode>#{@mode}</shipmentMethodCode>
        <measurement>
          <measurementTypeCode>NetWeight</measurementTypeCode>
          <measurementValue>#{(@unit_weight*@quantity).to_s}</measurementValue>
          <unitOfMeasureCode>KG</unitOfMeasureCode>
        </measurement>
        <measurement>
          <measurementTypeCode>NetNetWeight</measurementTypeCode>
          <measurementValue>#{(@unit_weight*@quantity).to_s}</measurementValue>
          <unitOfMeasureCode>KG</unitOfMeasureCode>
        </measurement>
        <party>
          <partyRoleCode>ShipmentDestination</partyRoleCode>
          <name>#{@destination_location}</name>
        </party>
      </baseItem>  }
    return xml_string
  end

  def random_program_type
    return ["Standard"].sample
  end

  def random_brand
    return ["Vandalay Industries", "Pennypacker Co."].sample
  end

  def random_channel
    return ["Online", "Retail", "Outlet"].sample
  end

  def random_market
    return ["CAN", "USA", "MEX"].sample
  end



end
