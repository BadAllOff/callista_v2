# frozen_string_literal: true

class CorrectDescriptionColumnTypeForServiceTranslationTable < ActiveRecord::Migration[5.2]
  def up
    change_column :service_translations, :description, :text
  end

  def down
    change_column :service_translations, :description, :string
  end
end
