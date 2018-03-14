class CreateChoices < ActiveRecord::Migration[5.1]
  def change
    create_table :choices do |t|
      t.string :title, null: false
      t.integer :priority, null: false, default: 0
      t.timestamps
    end
  end
end
