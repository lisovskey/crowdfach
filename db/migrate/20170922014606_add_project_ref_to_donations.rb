class AddProjectRefToDonations < ActiveRecord::Migration[5.1]
  def change
    add_reference :donations, :project, foreign_key: true
  end
end
