class CreateProjects < ActiveRecord::Migration[5.2]
  def change
    create_table :projects do |t|
      t.datetime :start_datetime, null:false
      t.string :title, null: false
      t.text :preview, null: false
      t.text :description, null: false

      t.timestamps
    end
  end
end
