require 'test_helper'

class KindOfScholarshipsControllerTest < ActionController::TestCase
  setup do
    @kind_of_scholarship = kind_of_scholarships(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:kind_of_scholarships)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create kind_of_scholarship" do
    assert_difference('KindOfScholarship.count') do
      post :create, kind_of_scholarship: { description: @kind_of_scholarship.description, ending_date: @kind_of_scholarship.ending_date, name: @kind_of_scholarship.name, short_description: @kind_of_scholarship.short_description, starting_date: @kind_of_scholarship.starting_date, state: @kind_of_scholarship.state }
    end

    assert_redirected_to kind_of_scholarship_path(assigns(:kind_of_scholarship))
  end

  test "should show kind_of_scholarship" do
    get :show, id: @kind_of_scholarship
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @kind_of_scholarship
    assert_response :success
  end

  test "should update kind_of_scholarship" do
    patch :update, id: @kind_of_scholarship, kind_of_scholarship: { description: @kind_of_scholarship.description, ending_date: @kind_of_scholarship.ending_date, name: @kind_of_scholarship.name, short_description: @kind_of_scholarship.short_description, starting_date: @kind_of_scholarship.starting_date, state: @kind_of_scholarship.state }
    assert_redirected_to kind_of_scholarship_path(assigns(:kind_of_scholarship))
  end

  test "should destroy kind_of_scholarship" do
    assert_difference('KindOfScholarship.count', -1) do
      delete :destroy, id: @kind_of_scholarship
    end

    assert_redirected_to kind_of_scholarships_path
  end
end
