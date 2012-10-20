require 'test_helper'

class CustomerFilesControllerTest < ActionController::TestCase
  setup do
    @customer_file = customer_files(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:customer_files)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create customer_file" do
    assert_difference('CustomerFile.count') do
      post :create, customer_file: { category_id: @customer_file.category_id, customer_id: @customer_file.customer_id, name: @customer_file.name }
    end

    assert_redirected_to customer_file_path(assigns(:customer_file))
  end

  test "should show customer_file" do
    get :show, id: @customer_file
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @customer_file
    assert_response :success
  end

  test "should update customer_file" do
    put :update, id: @customer_file, customer_file: { category_id: @customer_file.category_id, customer_id: @customer_file.customer_id, name: @customer_file.name }
    assert_redirected_to customer_file_path(assigns(:customer_file))
  end

  test "should destroy customer_file" do
    assert_difference('CustomerFile.count', -1) do
      delete :destroy, id: @customer_file
    end

    assert_redirected_to customer_files_path
  end
end
