class CreateDonations < ActiveRecord::Migration[5.1]
  def change
    create_table :donations do |t|
      t.monetize :amount
      t.timestamps
    end
  end
end
