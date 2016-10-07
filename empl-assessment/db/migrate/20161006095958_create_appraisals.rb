class CreateAppraisals < ActiveRecord::Migration[5.0]
  def change
    create_table :appraisals do |t|
      t.references :employee, foreign_key: true
      t.date :plannedDate
      t.date :actualDate
      t.text :comments

      t.timestamps
    end
  end
end
