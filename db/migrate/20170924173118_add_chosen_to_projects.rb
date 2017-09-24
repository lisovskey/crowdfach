class AddChosenToProjects < ActiveRecord::Migration[5.1]
  def change
    add_column :projects, :chosen, :boolean, default: false
    add_index :projects, :chosen
  end
end
