class CreateProjects < ActiveRecord::Migration[5.1]
  def change
    create_table :projects do |t|
      t.string :name,               null: false, default: ""
      t.string :description,        null: false, default: ""
      t.string :avatar,             null: false, default: ""

      t.integer :target,            null: false, default: 0
      t.integer :balance,           null: false, default: 0

      t.string :category,           null: false, default: ""

      t.text :full_description,     null: false, default: ""
      t.datetime :expiration_time,  null: false, default: "2020-01-01 00:00:00"

      t.timestamps null: false
    end
  end
end
