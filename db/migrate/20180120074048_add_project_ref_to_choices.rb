class AddProjectRefToChoices < ActiveRecord::Migration[5.1]
  def change
    add_reference :choices, :project, foreign_key: true
  end
end
