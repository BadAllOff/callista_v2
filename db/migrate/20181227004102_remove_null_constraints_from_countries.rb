# frozen_string_literal: true

class RemoveNullConstraintsFromCountries < ActiveRecord::Migration[5.2]
  def change
    change_column_default :countries, :name, from: nil, to: 'No translation'
    change_column_default :countries, :description, from: nil, to: 'No translation'
  end
end
