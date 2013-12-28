require 'test_helper'

class MyClassesControllerTest < ActionController::TestCase
  setup do
    @my_class = my_classes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:my_classes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create my_class" do
    assert_difference('MyClass.count') do
      post :create, :my_class => @my_class.attributes
    end

    assert_redirected_to my_class_path(assigns(:my_class))
  end

  test "should show my_class" do
    get :show, :id => @my_class.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @my_class.to_param
    assert_response :success
  end

  test "should update my_class" do
    put :update, :id => @my_class.to_param, :my_class => @my_class.attributes
    assert_redirected_to my_class_path(assigns(:my_class))
  end

  test "should destroy my_class" do
    assert_difference('MyClass.count', -1) do
      delete :destroy, :id => @my_class.to_param
    end

    assert_redirected_to my_classes_path
  end
end
