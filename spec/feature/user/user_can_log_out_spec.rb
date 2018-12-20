require 'rails_helper'

  context 'as a user' do
    it 'I can log out' do
      user = User.create(uid: '1234', google_token: '4321', email: 'example@gmail.com', name: "John Smith")
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit '/home'
      click_on "Log Out"

      expect(current_path).to eq('/')
    end
  end
