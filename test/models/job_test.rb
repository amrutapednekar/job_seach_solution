require "test_helper"

class JobTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "should not create a job without title" do
    job = Job.new(title: "")
    assert_not job.save, "Created a job without title"
  end

  test "should not create a job without spoken language" do
    job = Job.new(title:"Senior Developer",languages:[])
    assert_not job.save, "Created a job without spoken language"
  end

  test "Current user must exist" do
    job = Job.new(title: "Senior Developer1",languages: ["English"] ,shift_dates:1, salary_per_hour: 40,user_id: nil )
    assert_not job.save, "User must exist"
  end

end
