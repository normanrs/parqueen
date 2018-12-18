require 'rails_helper'

  context 'as a visitor' do
    it 'I can log in with google' do
      def stub_omniauth
        OmniAuth.config.test_mode = true
        OmniAuth.config.mock_auth[:google_oauth2] = OmniAuth::AuthHash.new({'uid'=> '1234','credentials' =>{'token' => '4321'},'info' =>{'email'=> "example@gmail.com"}, 'info' =>{'name'=> "John Smith"}})
      end

      stub_omniauth
      user = User.create(uid: '1234', token: '4321', email: 'example@gmail.com', name: "John Smith")
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit '/'
      click_link "Log in with Google"


      expect(page).to have_content('ParQueen')
      expect(current_path).to eq('/home')
      expect(page).to have_content('Logged in as John Smith')
    end
  end
