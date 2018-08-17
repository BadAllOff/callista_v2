class AddDescriptionColumnToCountries < ActiveRecord::Migration[5.2]
  def self.up
    add_column :countries, :description, :text, null: false
  end

  def self.down
    remove_column :countries, :description
  end
end
