class AddProjectRefToRewards < ActiveRecord::Migration[5.1]
  def change
    add_reference :rewards, :project, foreign_key: true
  end
end
