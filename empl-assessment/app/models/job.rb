class Job < ApplicationRecord
  JOB_TYPES = %w(DEV, BA, UX, UI, MGT)

  has_many :job_competencies, dependent: :delete_all

  validates :name, uniqueness: true, inclusion: {in: JOB_TYPES}

end
