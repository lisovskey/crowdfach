class AddScanToValidations < ActiveRecord::Migration[5.1]
  def change
    add_column :validations, :scan, :string
  end
end
