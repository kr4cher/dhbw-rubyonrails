require 'test_helper'

class LaboratoriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @laboratory = laboratories(:one)
  end

  test "should get index" do
    get laboratories_url
    assert_response :success
    assert_select "table.table"
  end

  test "should get new" do
    get new_laboratory_url
    assert_response :success
  end

  test "should create laboratory" do
    assert_difference('Laboratory.count') do
      post laboratories_url, params: { laboratory: { name: @laboratory.name } }
    end

    assert_redirected_to laboratory_url(Laboratory.last)
  end

  test "should show laboratory" do
    get laboratory_url(@laboratory)
    assert_response :success
  end

  test "should get edit" do
    get edit_laboratory_url(@laboratory)
    assert_response :success
  end

  test "should update laboratory" do
    patch laboratory_url(@laboratory), params: { laboratory: { name: @laboratory.name } }
    assert_redirected_to laboratory_url(@laboratory)
  end

  test "should destroy laboratory" do
    assert_difference('Laboratory.count', -1) do
      delete laboratory_url(@laboratory)
    end

    assert_redirected_to laboratories_url
  end

  test "shouldn't update laboratory with a blank" do
    patch laboratory_url(@laboratory), params: {laboratory: {name: ""}}
    assert_response :success
    assert_select "#error_explanation > h2", "1 error prohibited this laboratory from being saved:"
    assert_select "li", "Name can't be blank"
  end

  test "shouldn't create laboratory with a blank" do
    post laboratories_url, params: {laboratory: {name: ""}}
    assert_response :success
    assert_select "#error_explanation > h2", "1 error prohibited this laboratory from being saved:"
    assert_select "li", "Name can't be blank"
  end
end
