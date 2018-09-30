# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Country, type: :model do
  describe 'Associations' do
    it { should have_many(:realties).dependent(:destroy) }

    context '#preview_img' do
      subject { FactoryBot.build(:country).preview_img }
      it { is_expected.to be_an_instance_of(ActiveStorage::Attached::One) }
    end

    context '#flag_img' do
      subject { FactoryBot.build(:country).flag_img }
      it { is_expected.to be_an_instance_of(ActiveStorage::Attached::One) }
    end
  end

  describe 'Validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :description }
  end
end
