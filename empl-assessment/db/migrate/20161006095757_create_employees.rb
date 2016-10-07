class CreateEmployees < ActiveRecord::Migration[5.0]
  def change
    create_table :employees do |t|
      t.string :name
      t.references :employee,  foreign_key: true
      t.references :job, foreign_key: true

      t.timestamps
    end
  end
end
