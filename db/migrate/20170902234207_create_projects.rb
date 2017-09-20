class CreateProjects < ActiveRecord::Migration[5.1]
  def change
    create_table :projects do |t|
      t.string :name,               null: false, default: ""
      t.string :description,        null: false, default: ""
      t.string :avatar,             null: false, default: ""

      t.float :target,              null: false, default: 0
      t.float :balance,             null: false, default: 0

      t.text :full_description,     null: false, default: ""
      t.datetime :expiration_time,  null: false, default: "11 September, 2001"

      t.boolean :finished,          null: false, default: false
      t.boolean :successful

      t.timestamps null: false
    end
  end
end
