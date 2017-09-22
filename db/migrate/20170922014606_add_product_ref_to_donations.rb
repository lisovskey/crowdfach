class AddProductRefToDonations < ActiveRecord::Migration[5.1]
  def change
    add_reference :donations, :product, foreign_key: true
  end
end
