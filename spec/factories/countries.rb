# frozen_string_literal: true

FactoryBot.define do
  factory :country do
    name 'MyString'
    description 'Country description'

    after(:build) do |country|
      country.preview_img.attach(io: File.open(Rails.root.join('spec', 'factories', 'images', 'country.jpg')), filename: 'country.jpg', content_type: 'image/jpeg')
      country.flag_img.attach(io: File.open(Rails.root.join('spec', 'factories', 'images', 'flag.png')), filename: 'flag.png', content_type: 'image/png')
    end
  end
end
