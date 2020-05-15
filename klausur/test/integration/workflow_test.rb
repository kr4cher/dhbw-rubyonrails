require 'test_helper'

class WorkflowTest < ActionDispatch::IntegrationTest
  def setup
    @patient = patients(:one)
  end

  def test_workflow_step_1
    get root_url
    assert_select "td > a", "Gehe zum Arzt"
  end

  def test_workflow_step_2
    get see_doctor_url(@patient.doctor.id, params: {patient_id: @patient.id})
    assert_response :success
    assert_select "a", "Sende Probe von #{@patient.name} ans Labor"
  end

  def test_workflow_step_3
    get sample_laboratory_url(@patient.doctor.laboratory), params: {patient_id: @patient.id}
    assert_select "a.button.is-primary", "Test ausführen"
  end

  def test_workflow_step_4
    assert_difference('Infection.count') do
      get test_patient_url @patient, params: {laboratory: @patient.doctor.laboratory.id}
    end

    assert_redirected_to infection_path(Infection.last)
    follow_redirect!
    assert_select "h1", "Sie haben COVID-19. Bitte begeben sie sich in Quarantäne."
  end
end