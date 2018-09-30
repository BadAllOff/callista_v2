# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Realty, type: :model do
  describe 'Associations' do
    it { should belong_to(:country) }

    context '#preview_img' do
      subject { FactoryBot.build(:realty).preview_img }
      it { is_expected.to be_an_instance_of(ActiveStorage::Attached::One) }
    end

    context '#flag_img' do
      subject { FactoryBot.build(:realty).images }
      it { is_expected.to be_an_instance_of(ActiveStorage::Attached::Many) }
    end
  end

  describe 'Validations' do
    it { should validate_presence_of :title }
    it { should validate_presence_of :preview }
    it { should validate_presence_of :description }
  end
end