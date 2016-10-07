class CreateJobCompetencies < ActiveRecord::Migration[5.0]
  def change
    create_table :job_competencies do |t|
      t.references :job, foreign_key: true
      t.references :category, foreign_key: true

      t.timestamps
    end
  end
end
