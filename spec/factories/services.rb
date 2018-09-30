# frozen_string_literal: true

FactoryBot.define do
  factory :service do
    title 'MyText'
    preview 'MyText'
    description 'MyText'
    after(:build) do |service|
      service.preview_img.attach(io: File.open(Rails.root.join('spec', 'factories', 'images', 'service.jpg')), filename: 'service.jpeg', content_type: 'image/jpeg')
    end
  end
end
