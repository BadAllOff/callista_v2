class RemoveNullConstrainsFromProjects < ActiveRecord::Migration[5.2]
  class Project < ApplicationRecord; end

  def change
    change_column_null :projects, :title, true
    change_column_null :projects, :preview, true
    change_column_null :projects, :description, true
  end
end
