require 'test_helper'

class LaboratoryTest < ActiveSupport::TestCase
  test "can list all detected infections" do
    laboratory = laboratories(:one)
    assert_equal [doctors(:one)], laboratory.doctors
    assert_equal [patients(:one)], laboratory.doctors.map(&:patients).flatten.to_a
    assert_equal [infections(:one)], laboratory.doctors.map(&:patients).flatten.map(&:infections).flatten.to_a
  end
end
