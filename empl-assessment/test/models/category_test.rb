require 'test_helper'

class CategoryTest < ActiveSupport::TestCase
  test "category without name" do
    assert_raises(ActiveRecord::RecordInvalid) do
      Category.create!()
    end
  end
end
