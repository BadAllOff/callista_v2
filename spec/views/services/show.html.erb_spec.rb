# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'services/show', type: :view do
  before(:each) do
    @service = assign(:service, Service.create!(
                                  title: 'MyText',
                                  preview: 'MyText',
                                  description: 'MyText'
                                ))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/MyText/)
  end
end
