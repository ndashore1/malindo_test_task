# frozen_string_literal: true

require 'rails_helper'
require 'email_generator'

describe EmailGenerator do
  describe '.call' do
    subject(:emails) { described_class.call('Ben', 'Pratt', '8returns.com') }

    it 'returns emails with different combinations of first name, last name and url' do
      expect(emails[0]).to(eql('ben.pratt@8returns.com'))
      expect(emails[1]).to(eql('ben@8returns.com'))
      expect(emails[2]).to(eql('benpratt@8returns.com'))
      expect(emails[3]).to(eql('pratt.ben@8returns.com'))
      expect(emails[4]).to(eql('b.pratt@8returns.com'))
      expect(emails[5]).to(eql('bp@8returns.com'))
    end
  end
end
