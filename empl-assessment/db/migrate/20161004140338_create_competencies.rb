class CreateCompetencies < ActiveRecord::Migration[5.0]
  def change
    create_table :categories do |t|
      t.string :name

      t.timestamps
    end

    create_table :competencies do |t|
      t.string :name
      t.string :description
      t.belongs_to :category, index: true

      t.timestamps
    end
  end
end
