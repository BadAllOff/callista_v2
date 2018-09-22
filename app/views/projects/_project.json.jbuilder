# frozen_string_literal: true

json.extract! project, :id, :start_datetime, :title, :preview, :description, :created_at, :updated_at
json.url project_url(project, format: :json)
