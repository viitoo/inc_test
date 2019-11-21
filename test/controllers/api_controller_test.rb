require 'test_helper'

class ApiControllerTest < ActionDispatch::IntegrationTest
  test "should get clientes" do
    get api_clientes_url
    assert_response :success
  end

  test "should get cliente" do
    get api_cliente_url
    assert_response :success
  end

  test "should get transacciones" do
    get api_transacciones_url
    assert_response :success
  end

end
