class Competency < ApplicationRecord
  belongs_to :category
  has_many :competency_evaluations

  validates :name, :category, presence: true
end
