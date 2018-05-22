class OutboundUnifiedOrder < UnifiedOrder


  def order_detail_xml
    xml_string = super
    xml_string += %{
    <licenseeRoleCode>Seller</licenseeRoleCode>}
    return xml_string
  end

  def party_xml
    xml_string = %{
    <party>
      <partyRoleCode>Buyer</partyRoleCode>
      <memberId>#{@buyer}</memberId>
    </party>
    <party>
      <partyRoleCode>Seller</partyRoleCode>
      <memberId>#{@seller_id}</memberId>
      <divisionUid>#{@division_id}</divisionUid>
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
      <partyRoleCode>OriginOfGoods</partyRoleCode>
      <memberId>#{@seller_id}</memberId>
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


  def write_to_file
    @message_xml = as_xml
    file_path = Rails.root.join('public','xml_files').to_s
    File.open(file_path + "/" + @file_name, "w+") do |f|
      f.write(@message_xml)
    end
  end 


end
