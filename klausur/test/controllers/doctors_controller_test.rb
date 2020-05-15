require 'test_helper'

class DoctorsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @doctor = doctors(:one)
  end

  test "should get index" do
    get doctors_url
    assert_response :success
    assert_select "table.table"
  end

  test "should get new" do
    get new_doctor_url
    assert_response :success
  end

  test "should create doctor" do
    assert_difference('Doctor.count') do
      post doctors_url, params: {doctor: {laboratory_id: @doctor.laboratory_id, name: @doctor.name}}
    end

    assert_redirected_to doctor_url(Doctor.last)
  end

  test "should show doctor" do
    get doctor_url(@doctor)
    assert_response :success
  end

  test "should get edit" do
    get edit_doctor_url(@doctor)
    assert_response :success
  end

  test "should update doctor" do
    patch doctor_url(@doctor), params: {doctor: {laboratory_id: @doctor.laboratory_id, name: @doctor.name}}
    assert_redirected_to doctor_url(@doctor)
  end

  test "should destroy doctor" do
    assert_difference('Doctor.count', -1) do
      delete doctor_url(@doctor)
    end

    assert_redirected_to doctors_url
  end

  test "shouldn't update doctor with a space in it's name" do
    patch doctor_url(@doctor), params: {doctor: {name: "NAME-Without-Space"}}
    assert_response :success
    assert_select "#error_explanation > h2", "1 error prohibited this doctor from being saved:"
    assert_select "li", "Name does not contain a space"
  end

  test "shouldn't create a doctor without a lab" do
    post doctors_url, params: {doctor: {name: "NAME with Space"}}
    assert_response :success
    assert_select "#error_explanation > h2", "1 error prohibited this doctor from being saved:"
    assert_select "li", "Laboratory must exist"
  end
end
