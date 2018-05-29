class CreateProjects < ActiveRecord::Migration[5.1]
  def change
    create_table :projects do |t|
      t.string :name,               null: false, default: ""
      t.string :description,        null: false, default: ""

      t.monetize :target,           null: false, default: 0
      t.monetize :balance,          null: false, default: 0

      t.text :full_description,     null: false, default: ""
      t.datetime :expiration_time

      t.boolean :finished,          null: false, default: false
      t.boolean :successful

      t.timestamps null: false
    end

    add_index :projects, :name
    add_index :projects, :description
  end
end
