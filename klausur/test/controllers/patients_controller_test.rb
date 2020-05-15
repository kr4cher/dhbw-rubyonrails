require 'test_helper'

class PatientsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @patient = patients(:one)
  end

  test "should get index" do
    get patients_url
    assert_response :success
    assert_select "table.table"
  end

  test "should get new" do
    get new_patient_url
    assert_response :success
  end

  test "should create patient" do
    assert_difference('Patient.count') do
      post patients_url, params: { patient: { doctor_id: @patient.doctor_id, email: @patient.email, mobile: @patient.mobile, name: @patient.name } }
    end

    assert_redirected_to patient_url(Patient.last)
  end

  test "should show patient" do
    get patient_url(@patient)
    assert_response :success
  end

  test "should get edit" do
    get edit_patient_url(@patient)
    assert_response :success
  end

  test "should update patient" do
    patch patient_url(@patient), params: { patient: { doctor_id: @patient.doctor_id, email: @patient.email, mobile: @patient.mobile, name: @patient.name } }
    assert_redirected_to patient_url(@patient)
  end

  test "should destroy patient" do
    assert_difference('Patient.count', -1) do
      delete patient_url(@patient)
    end

    assert_redirected_to patients_url
  end

  test "shouldn't update patient without an email" do
    patch patient_url(@patient), params: {patient: {email: nil}}
    assert_response :success
    assert_select "#error_explanation > h2", "1 error prohibited this patient from being saved:"
    assert_select "li", "Email can't be blank"
  end

  test "shouldn't create a patient without a name" do
    post patients_url, params: {patient: {email: "this-is@my.mail", doctor_id: doctors(:one).id}}
    assert_response :success
    assert_select "#error_explanation > h2", "1 error prohibited this patient from being saved:"
    assert_select "li", "Name can't be blank"
  end
end
