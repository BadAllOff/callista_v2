# frozen_string_literal: true

class CreatTranslationTableForProjects < ActiveRecord::Migration[5.2]
  def change
    reversible do |dir|
      dir.up do
        Project.create_translation_table!(
          title: { type: :string, default: 'No translation.' },
          preview: { type: :text, default: 'No translation.' },
          description: { type: :text, default: 'No translation.' }
        )
      end

      dir.down do
        Project.drop_translation_table!
      end
    end
  end
end
