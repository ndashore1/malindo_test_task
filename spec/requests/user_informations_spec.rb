# frozen_string_literal: true

require 'rails_helper'

RSpec.describe('Records', type: :request) do
  let!(:user_information) { create(:user_information) }

  describe 'GET user_informations#show' do
    before { get '/' }

    it 'renders searched results' do
      expect(response).to(have_http_status(200))
      expect(response).to(render_template(:show))
    end
  end

  describe 'POST user_informations#search' do
    context 'when user information is valid' do
      before do
        allow(EmailFinder).to(receive(:call).and_return(user_information))
        post '/search',
             params: {
               user_information: {
                 first_name: 'john', last_name: 'doe', url: '8returns.com'
               },
             }
      end

      it 'renders email of user information found' do
        expect(response).to(have_http_status(302))
        follow_redirect!
        expect(response).to(render_template(:show))
      end
    end

    context 'when user information is invalid' do
      before do
        post '/search',
             params: {
               user_information: {
                 first_name: 'john', last_name: 'doe', url: '@returns.com'
               },
             }
      end

      it 'renders email of user information found' do
        expect(response).to(have_http_status(302))
        follow_redirect!
        expect(flash[:alert]).to(eq('Url is invalid'))
      end
    end
  end
end
