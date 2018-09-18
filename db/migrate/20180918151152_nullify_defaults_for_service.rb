class NullifyDefaultsForService < ActiveRecord::Migration[5.2]
  def change
    change_column_default :services, :title, from: 'Service title', to: nil
    change_column_default :services, :preview, from: 'Service preview', to: nil
    change_column_default :services, :description, from: 'Service description', to: nil
  end

end
