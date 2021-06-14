# frozen_string_literal: true

describe EmailFinder do
  let(:user_information) { create(:user_information) }

  describe '#call' do
    context 'when user information is present in system' do
      it 'returns user information' do
        response = described_class.call(user_information.attributes.symbolize_keys)
        expect(response.id).to(eql(user_information.id))
      end
    end

    context 'when user information is not present in system' do
      context 'when email is valid' do
        before do
          response =
            VCR.use_cassette('email_validator/success') do
              Apilayer::Mailbox.check('support@apilayer.com')
            end
          allow(Apilayer::Mailbox).to(receive(:check).and_return(response))
          allow(EmailGenerator).to(receive(:call).and_return(['support@apilayer.com']))
        end

        it 'creates and returns user information' do
          contact_details = { first_name: 'sup', last_name: 'port', url: 'apilayer.com' }
          user_information = described_class.call(contact_details)
          expect(user_information.persisted?).to(be_truthy)
        end
      end

      context 'when email is invalid' do
        before do
          response =
            VCR.use_cassette('email_validator/invalid_format') do
              Apilayer::Mailbox.check('saaexample@.com')
            end
          allow(Apilayer::Mailbox).to(receive(:check).and_return(response))
        end

        it 'does not creates user information' do
          contact_details = { first_name: 'sup', last_name: 'port', url: 'apilayer.com' }
          user_information = described_class.call(contact_details)
          expect(user_information&.persisted?).to(be_falsey)
        end
      end
    end
  end
end
