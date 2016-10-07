class Appraisal < ApplicationRecord
  belongs_to :employee
  has_many :competency_evaluation, dependent: :destroy

  enum status: [:planned, :inProgress, :completed]

  def self.lastCompleted(employee)
    Appraisal.where(employee: employee, status: :completed).order(:completed_at).last
  end

  def self.upcomingAppraisal(employee)
    Appraisal.where(employee: employee, status: [:planned]).first
  end

  def self.currentAppraisal(employee)
    Appraisal.where(employee: employee, status: [:inProgress]).first
  end

  def start
    self.update(started_at: Date.current, status: :inProgress)
  end

  def complete
    self.update(completed_at: Date.current, status: :completed)

    Appraisal.create(employee: employee, status: :planned, planned_on: completed_at + 6.month)
  end

  def previous
    Appraisal.where("employee_id = ? and completed_at < ?", employee, completed_at ? completed_at : planned_on)
        .order(:completed_at).last
  end

  def competencies

  end

end
