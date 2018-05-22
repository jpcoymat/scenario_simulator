class InboundUnifiedOrder < UnifiedOrder



  def write_to_file
    @message_xml = as_xml
    file_path = Rails.root.join('public','xml_files').to_s
    File.open(file_path + "/" + @file_name, "w+") do |f|
      f.write(@message_xml)
    end
  end 


end
