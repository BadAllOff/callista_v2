# frozen_string_literal: true

class CreateRealties < ActiveRecord::Migration[5.2]
  def change
    create_table :realties do |t|
      t.references :country, foreign_key: true
      t.string :title, null: false
      t.text :preview, null: false
      t.text :description, null: false

      t.timestamps
    end
  end
end
