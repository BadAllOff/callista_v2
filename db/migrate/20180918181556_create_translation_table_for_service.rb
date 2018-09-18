class CreateTranslationTableForService < ActiveRecord::Migration[5.2]
  def change
    reversible do |dir|
      dir.up do
        Service.create_translation_table!(
            title: {type: :string, default: 'No translation.'},
            preview: {type: :string, default: 'No translation.'},
            description: {type: :string, default: 'No translation.'}
        )
      end

      dir.down do
        Service.drop_translation_table!
      end
    end
  end
end
