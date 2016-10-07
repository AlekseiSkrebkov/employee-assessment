require 'test_helper'

class CompetencyTest < ActiveSupport::TestCase

  test "competency mandatory fields" do
    competency = Competency.new

    #no data
    assert_not competency.save

    #only name, no category
    competency.name = "Test competency"
    assert_not competency.save

    #category and name
    competency.category = categories(:personality)
    assert competency.save

    #only category, no name
    competency.name = nil
    assert_not competency.save
  end

end
