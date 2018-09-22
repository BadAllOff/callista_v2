# frozen_string_literal: true

class CreateServices < ActiveRecord::Migration[5.2]
  def change
    create_table :services do |t|
      t.text :title, default: 'Service title', null: false
      t.text :preview, default: 'Service preview text', null: false
      t.text :description, default: 'Service description', null: false

      t.timestamps
    end
  end
end
