require 'test_helper'

class Admin::OrdersItemsControllerTest < ActionDispatch::IntegrationTest
  test "should get update" do
    get admin_orders_items_update_url
    assert_response :success
  end

end
