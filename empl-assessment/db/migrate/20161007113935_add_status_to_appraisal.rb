class AddStatusToAppraisal < ActiveRecord::Migration[5.0]
  def change
    add_column :appraisals, :status, :integer
  end
end
