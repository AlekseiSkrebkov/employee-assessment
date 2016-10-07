class RenameStartDateColumnInAppraisal < ActiveRecord::Migration[5.0]
  def change
    rename_column :appraisals, :start_date, :started_at
  end
end
