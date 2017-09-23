class AddValidationRefToUsers < ActiveRecord::Migration[5.1]
  def change
    add_reference :users, :validation, foreign_key: true
  end
end
