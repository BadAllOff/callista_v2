# frozen_string_literal: true

require_relative '../../acceptance/acceptance_helper'

feature 'Create Project', '
In order to add Project to website
As an authenticated user
I want be able to add project
' do

  given(:user) { create(:user) }
  describe 'Authenticated user' do
    before do
      sign_in(user)
      visit projects_path
    end

    scenario '- creates project' do
      click_on I18n.t('project.new.add_project')
      fill_in I18n.t('activerecord.attributes.project.title'), with: 'Test project'
      fill_in I18n.t('activerecord.attributes.project.preview'), with: 'Test preview'
      fill_in I18n.t('activerecord.attributes.project.description'), with: 'Test project description'
      # save_and_open_page
      fill_in 'project[start_datetime]', with: '2018-08-17 14:34:53'
      attach_file 'Preview image', "#{Rails.root}/spec/fixtures/project.jpg"
      click_on I18n.t('helpers.submit.project.create')

      expect(page).to have_content 'Test project'
      expect(page).to have_content 'Test project description'
    end
  end

end
