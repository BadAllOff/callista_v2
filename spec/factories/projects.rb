# frozen_string_literal: true

FactoryBot.define do
  factory :project do
    start_datetime '2018-08-17 14:34:53'
    title 'MyString'
    preview 'MyText'
    description 'MyText'
    after(:build) do |project|
      project.preview_img.attach(io: File.open(Rails.root.join('spec', 'factories', 'images', 'project.jpg')), filename: 'project.jpeg', content_type: 'image/jpeg')
    end
  end
end
