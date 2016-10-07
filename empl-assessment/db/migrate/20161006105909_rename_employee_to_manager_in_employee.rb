class RenameEmployeeToManagerInEmployee < ActiveRecord::Migration[5.0]
  def change
    rename_column :employees, :employee_id, :manager_id
  end
end
