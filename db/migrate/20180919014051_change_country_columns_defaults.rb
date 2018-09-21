class ChangeCountryColumnsDefaults < ActiveRecord::Migration[5.2]
  def change
    change_column_default :country_translations, :name, from: nil, to: 'No translation'
    change_column_default :country_translations, :description, from: nil, to: 'No translation'
  end
end
