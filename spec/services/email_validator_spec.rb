# frozen_string_literal: true

describe EmailValidator do
  describe '.valid?' do
    shared_examples 'invalid_email' do |email|
      it 'returns false' do
        expect(described_class.valid?(email)).to(be_falsey)
      end
    end

    context 'when API key is valid' do
      context 'when email address format is valid' do
        context 'when email address exists' do
          before do
            response =
              VCR.use_cassette('email_validator/success') do
                Apilayer::Mailbox.check('support@apilayer.com')
              end
            allow(Apilayer::Mailbox).to(receive(:check).and_return(response))
          end

          it 'returns true' do
            expect(described_class.valid?('support@apilayer.com')).to(be_truthy)
          end
        end

        context 'when email address does not exists' do
          before do
            response =
              VCR.use_cassette('email_validator/failure') do
                Apilayer::Mailbox.check('abc123@example.com')
              end
            allow(Apilayer::Mailbox).to(receive(:check).and_return(response))
          end

          it_behaves_like 'invalid_email', 'abc123@example.com'
        end
      end

      context 'when email address format is invalid' do
        before do
          response =
            VCR.use_cassette('email_validator/invalid_format') do
              Apilayer::Mailbox.check('saaexample@.com')
            end
          allow(Apilayer::Mailbox).to(receive(:check).and_return(response))
        end

        it_behaves_like 'invalid_email', 'saaexample@.com'
      end
    end

    # context 'when API key is invalid' do
    #   before do
    #     Apilayer::Mailbox.configure do |configs|
    #       configs.access_key = '123'
    #     end
    #   end

    #   it_behaves_like 'invalid_email', 'support@apilayer.com'
    # end
  end
end
