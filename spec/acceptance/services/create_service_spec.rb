# frozen_string_literal: true

require_relative '../../acceptance/acceptance_helper'

feature 'Create Service', '
In order to add Consulting Services to website
As an authenticated user
I want be able to add service
' do

  given(:user) { create(:user) }
  describe 'Authenticated user' do
    before do
      sign_in(user)
      visit services_path
    end

    scenario '- creates service' do
      click_on I18n.t('services.new.add_service')
      fill_in I18n.t('activerecord.attributes.service.title'), with: 'Test service'
      fill_in I18n.t('activerecord.attributes.service.preview'), with: 'Test preview'
      fill_in I18n.t('activerecord.attributes.service.description'), with: 'Test description'
      # click_on I18n.t('activerecord.attributes.service.preview_img')
      # save_and_open_page
      attach_file 'Preview image', "#{Rails.root}/spec/fixtures/service.jpg"
      click_on I18n.t('helpers.submit.service.create')



      # expect(page).to have_content 'Question successfully created'
      expect(page).to have_content 'Test service'
      expect(page).to have_content 'Test description'
    end
  end

end
