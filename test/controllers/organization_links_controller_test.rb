require 'test_helper'

class OrganizationLinksControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get organization_links_index_url
    assert_response :success
  end

end
