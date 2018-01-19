class AddChosenAtToProjects < ActiveRecord::Migration[5.1]
  def change
    add_column :projects, :chosen_at, :datetime
    add_index :projects, :chosen_at
  end
end
