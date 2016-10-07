require 'test_helper'

class EmployeeTest < ActiveSupport::TestCase
  test "employee mandatory fields" do
    employee = Employee.new

    employee.name = "Test Name"
    employee.job = jobs(:dev)
    employee.manager = employees(:ilyav)

    employee.save!

  end
end
