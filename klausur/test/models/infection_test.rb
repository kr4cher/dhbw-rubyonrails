require 'test_helper'

class InfectionTest < ActiveSupport::TestCase
  test "can navigate to laboratory" do
    infection = infections(:one)
    assert_equal patients(:one), infection.patient
    assert_equal doctors(:one), infection.patient.doctor
    assert_equal laboratories(:one), infection.patient.doctor.laboratory
  end
end
