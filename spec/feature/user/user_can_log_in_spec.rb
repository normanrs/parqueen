require 'rails_helper'

  context 'as a user' do
    it 'I can log in with google' do
      user = User.create(uid: '1234', google_token: '4321', email: 'example@gmail.com', name: "John Smith")
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit '/home'

      expect(user.uid).to eq('1234')
      expect(user.google_token).to eq('4321')
      expect(user.name).to eq('John Smith')
      expect(user.email).to eq('example@gmail.com')
      expect(current_path).to eq('/home')
    end
  end
