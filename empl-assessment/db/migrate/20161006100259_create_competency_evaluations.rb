class CreateCompetencyEvaluations < ActiveRecord::Migration[5.0]
  def change
    create_table :competency_evaluations do |t|
      t.references :appraisal, foreign_key: true
      t.references :competency, foreign_key: true, on_delete: :cascade
      t.integer :mark
      t.text :comments

      t.timestamps
    end
  end
end
