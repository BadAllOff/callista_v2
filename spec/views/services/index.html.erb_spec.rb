# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'services/index', type: :view do
  before(:each) do
    assign(:services, [
             Service.create!(
               title: 'MyText',
               preview: 'MyText',
               description: 'MyText'
             ),
             Service.create!(
               title: 'MyText',
               preview: 'MyText',
               description: 'MyText'
             )
           ])
  end

  it 'renders a list of services' do
    render
    assert_select 'tr>td', text: 'MyText'.to_s, count: 2
    assert_select 'tr>td', text: 'MyText'.to_s, count: 2
    assert_select 'tr>td', text: 'MyText'.to_s, count: 2
  end
end
