class RenameCategoryFieldToCategoryIdInCompetencies < ActiveRecord::Migration[5.0]
  def change
    rename_column :competencies, :category, :category_id
  end
end
