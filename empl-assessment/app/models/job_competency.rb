class JobCompetency < ApplicationRecord
  belongs_to :job
  belongs_to :category
end
