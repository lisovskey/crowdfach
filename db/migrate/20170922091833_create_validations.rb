class CreateValidations < ActiveRecord::Migration[5.1]
  def change
    create_table :validations do |t|
      t.string :no
      t.date :expiration_date
      t.string :first_name
      t.string :last_name
      t.string :address
      t.string :country
      t.string :city
      t.string :index

      t.timestamps
    end
  end
end
