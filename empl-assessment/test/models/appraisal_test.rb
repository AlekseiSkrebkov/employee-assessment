require 'test_helper'

class AppraisalTest < ActiveSupport::TestCase

  test "employee appraisals" do
    employee = employees(:alexs)

    lastCompleted = Appraisal.lastCompleted(employee)
    assert_not_nil lastCompleted
    assert lastCompleted.completed?
    assert_not_nil lastCompleted.completed_at

    current = Appraisal.currentAppraisal(employee)
    assert_not_nil current
    assert current.inProgress?
    assert_not_nil current.planned_on
    assert_nil current.completed_at

    assert current.previous == lastCompleted

    assert_difference 'Appraisal.all.count', 1 do
      current.complete
    end
    assert current.completed?

    upcoming = Appraisal.upcomingAppraisal(employee)
    assert upcoming.planned?
    assert (upcoming.planned_on - 6.month) == Date.current

    assert upcoming.previous == current
    assert upcoming.previous.previous == lastCompleted

    upcoming.start
    assert upcoming.inProgress?

    assert upcoming.previous == current
  end
end
