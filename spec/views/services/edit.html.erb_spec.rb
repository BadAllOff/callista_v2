# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'services/edit', type: :view do
  before(:each) do
    @service = assign(:service, Service.create!(
                                  title: 'MyText',
                                  preview: 'MyText',
                                  description: 'MyText'
                                ))
  end

  it 'renders the edit service form' do
    render

    assert_select 'form[action=?][method=?]', service_path(@service), 'post' do
      assert_select 'textarea[name=?]', 'service[title]'

      assert_select 'textarea[name=?]', 'service[preview]'

      assert_select 'textarea[name=?]', 'service[description]'
    end
  end
end
