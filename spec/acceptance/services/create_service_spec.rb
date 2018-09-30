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

    scenario 'Create service with valid data' do
    end
  end

end
