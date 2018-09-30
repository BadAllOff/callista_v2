# frozen_string_literal: true

FactoryBot.define do
  factory :realty do
    title 'MyString'
    description 'Realty description'

    after(:build) do |realty|
      realty.preview_img.attach(io: File.open(Rails.root.join('spec', 'factories', 'images', 'realty.jpg')), filename: 'realty.jpg', content_type: 'image/jpeg')
      realty.images.attach(io: File.open(Rails.root.join('spec', 'factories', 'images', 'realty-image1.jpg')), filename: 'realty-image1.jpg', content_type: 'image/jpeg')
    end
  end
end
