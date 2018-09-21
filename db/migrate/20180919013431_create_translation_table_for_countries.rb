class CreateTranslationTableForCountries < ActiveRecord::Migration[5.2]
  def change
    reversible do |dir|
      dir.up do
        Country.create_translation_table!({
                                           :name => :string,
                                           :description => :text
                                       }, {
                                           :migrate_data => true
                                       })
      end

      dir.down do
        Country.drop_translation_table! migrate_data: true
      end
    end
  end
end
