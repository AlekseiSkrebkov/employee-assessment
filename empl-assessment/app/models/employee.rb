class Employee < ApplicationRecord
  belongs_to :manager, class_name: Employee
  belongs_to :job
  has_many :appraisal, dependent: :destroy

  validates :name, :job, presence: true

  def lastAppraisal
    Appraisal.lastCompleted(self)
  end

  def activeAppraisal
    Appraisal.activeAppraisal(self)
  end

end
