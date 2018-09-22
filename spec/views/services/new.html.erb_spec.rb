# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'services/new', type: :view do
  before(:each) do
    assign(:service, Service.new(
                       title: 'MyText',
                       preview: 'MyText',
                       description: 'MyText'
                     ))
  end

  it 'renders new service form' do
    render

    assert_select 'form[action=?][method=?]', services_path, 'post' do
      assert_select 'textarea[name=?]', 'service[title]'

      assert_select 'textarea[name=?]', 'service[preview]'

      assert_select 'textarea[name=?]', 'service[description]'
    end
  end
end
