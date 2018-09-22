# frozen_string_literal: true

json.extract! country_realty, :id, :title, :preview, :description, :created_at, :updated_at
json.url country_realty_url(country_realty, format: :json)
