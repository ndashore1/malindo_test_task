# frozen_string_literal: true

require 'rails_helper'

RSpec.describe(UserInformation, type: :model) do
  let(:user_information) { create(:user_information) }

  describe 'Validations' do
    it { is_expected.to(validate_presence_of(:first_name)) }
    it { is_expected.to(validate_presence_of(:last_name)) }
    it { is_expected.to(validate_presence_of(:url)) }
    it { is_expected.to(allow_value('gmail.com').for(:url)) }
    it { is_expected.to_not(allow_value('.com').for(:url)) }

    context 'validates uniquess of email' do
      subject { build(:user_information) }

      it { expect(subject).to(validate_uniqueness_of(:email)) }
    end
  end
end
