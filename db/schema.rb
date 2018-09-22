# frozen_string_literal: true

# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20_180_919_014_051) do
  # These are extensions that must be enabled in order to support this database
  enable_extension 'plpgsql'

  create_table 'active_storage_attachments', force: :cascade do |t|
    t.string 'name', null: false
    t.string 'record_type', null: false
    t.bigint 'record_id', null: false
    t.bigint 'blob_id', null: false
    t.datetime 'created_at', null: false
    t.index ['blob_id'], name: 'index_active_storage_attachments_on_blob_id'
    t.index %w[record_type record_id name blob_id], name: 'index_active_storage_attachments_uniqueness', unique: true
  end

  create_table 'active_storage_blobs', force: :cascade do |t|
    t.string 'key', null: false
    t.string 'filename', null: false
    t.string 'content_type'
    t.text 'metadata'
    t.bigint 'byte_size', null: false
    t.string 'checksum', null: false
    t.datetime 'created_at', null: false
    t.index ['key'], name: 'index_active_storage_blobs_on_key', unique: true
  end

  create_table 'ckeditor_assets', force: :cascade do |t|
    t.string 'data_file_name', null: false
    t.string 'data_content_type'
    t.integer 'data_file_size'
    t.string 'type', limit: 30
    t.integer 'width'
    t.integer 'height'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['type'], name: 'index_ckeditor_assets_on_type'
  end

  create_table 'countries', force: :cascade do |t|
    t.string 'name', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.text 'description', null: false
  end

  create_table 'country_translations', force: :cascade do |t|
    t.integer 'country_id', null: false
    t.string 'locale', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.string 'name', default: 'No translation'
    t.text 'description', default: 'No translation'
    t.index ['country_id'], name: 'index_country_translations_on_country_id'
    t.index ['locale'], name: 'index_country_translations_on_locale'
  end

  create_table 'project_translations', force: :cascade do |t|
    t.integer 'project_id', null: false
    t.string 'locale', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.string 'title', default: 'No translation.'
    t.text 'preview', default: 'No translation.'
    t.text 'description', default: 'No translation.'
    t.index ['locale'], name: 'index_project_translations_on_locale'
    t.index ['project_id'], name: 'index_project_translations_on_project_id'
  end

  create_table 'projects', force: :cascade do |t|
    t.datetime 'start_datetime', null: false
    t.string 'title'
    t.text 'preview'
    t.text 'description'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'realties', force: :cascade do |t|
    t.bigint 'country_id'
    t.string 'title', null: false
    t.text 'preview', null: false
    t.text 'description', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['country_id'], name: 'index_realties_on_country_id'
  end

  create_table 'service_translations', force: :cascade do |t|
    t.integer 'service_id', null: false
    t.string 'locale', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.string 'title', default: 'No translation.'
    t.string 'preview', default: 'No translation.'
    t.text 'description', default: 'No translation.'
    t.index ['locale'], name: 'index_service_translations_on_locale'
    t.index ['service_id'], name: 'index_service_translations_on_service_id'
  end

  create_table 'services', force: :cascade do |t|
    t.string 'title'
    t.string 'preview'
    t.text 'description'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'users', force: :cascade do |t|
    t.string 'email', default: '', null: false
    t.string 'encrypted_password', default: '', null: false
    t.string 'reset_password_token'
    t.datetime 'reset_password_sent_at'
    t.datetime 'remember_created_at'
    t.string 'confirmation_token'
    t.datetime 'confirmed_at'
    t.datetime 'confirmation_sent_at'
    t.string 'unconfirmed_email'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['confirmation_token'], name: 'index_users_on_confirmation_token', unique: true
    t.index ['email'], name: 'index_users_on_email', unique: true
    t.index ['reset_password_token'], name: 'index_users_on_reset_password_token', unique: true
  end

  add_foreign_key 'realties', 'countries'
end
