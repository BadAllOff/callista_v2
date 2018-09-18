class RemoveNullConstraintFromService < ActiveRecord::Migration[5.2]
  def change
    change_column_null :services, :title, true
    change_column_null :services, :preview, true
    change_column_null :services, :description, true
  end
end
