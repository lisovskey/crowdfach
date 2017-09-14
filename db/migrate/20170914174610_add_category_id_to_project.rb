class AddCategoryIdToProject < ActiveRecord::Migration[5.1]
  def change
    add_reference :projects, :category, foreign_key: true
  end
end
