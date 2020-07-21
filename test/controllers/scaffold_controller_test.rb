require 'test_helper'

class ScaffoldControllerTest < ActionDispatch::IntegrationTest
  test "should get Node" do
    get scaffold_Node_url
    assert_response :success
  end

end
