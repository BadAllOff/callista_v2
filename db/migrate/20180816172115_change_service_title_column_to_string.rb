# frozen_string_literal: true

class ChangeServiceTitleColumnToString < ActiveRecord::Migration[5.2]
  class Service < ApplicationRecord; end
  def up
    change_column :services, :title, :string, default: 'Service title', null: false
    change_column :services, :preview, :string, default: 'Service preview', null: false
  end

  def down
    change_column :services, :title, :text, default: 'Service title', null: false
    change_column :services, :preview, :text, default: 'Service preview', null: false
  end
end
