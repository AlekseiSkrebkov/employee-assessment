require 'test_helper'

class JobTest < ActiveSupport::TestCase
  test "job names" do
    #job with no name
    job = Job.new
    assert_not job.save

    #job with incorrect name
    job.name = "Incorrect name"
    assert_not job.save

    #job with correct names
    Job::JOB_TYPES.each do |job_type|
      if !Job.where(name: job_type).exists?
        job.name = job_type
        assert job.save
      end
    end
  end

  test "job uniqueness" do
    Job::JOB_TYPES.each do |job_type|
      if Job.where(name: job_type).exists?
        job = Job.new
        job.name = job_type
        assert_not job.save
      end
    end
  end

  test "job deletion" do
    firstJobId = JobCompetency.first.job.id
    jobCompetenciesNumber = JobCompetency.where(job_id: firstJobId).count

    assert_difference 'JobCompetency.all.count', -jobCompetenciesNumber do
      Job.find(firstJobId).destroy
    end

    assert true
  end

end
