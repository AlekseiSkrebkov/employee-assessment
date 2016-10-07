class RefactorAppraisalDateFields < ActiveRecord::Migration[5.0]
  def change
    add_column :appraisals, :started_at, :date
    rename_column :appraisals, :actualDate, :completed_at
    rename_column :appraisals, :plannedDate, :planned_on
  end
end
