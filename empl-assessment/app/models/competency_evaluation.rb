class CompetencyEvaluation < ApplicationRecord
  belongs_to :appraisal
  belongs_to :competency

  validates :mark, presence:true, numericality: {only_integer: true}, inclusion: {in: [1..10]}
end
