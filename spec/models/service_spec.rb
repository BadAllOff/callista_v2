# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Service, type: :model do
  describe 'Associations' do
    context '#preview_img' do
      subject { FactoryBot.build(:service).preview_img }
      it { is_expected.to be_an_instance_of(ActiveStorage::Attached::One) }
    end
  end

  describe 'Validations' do
    it { should validate_presence_of :title }
    it { should validate_presence_of :preview }
    it { should validate_presence_of :description }
  end
end
