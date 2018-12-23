require 'rails_helper'

describe 'as a user' do
  describe 'when I log in' do
    it 'Im taken to a page to set my notification prefences' do
      user = User.create(uid: '1234', google_token: '4321', email: 'example@gmail.com', name: "John Smith")
      phone = "7175565567"
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit '/home'

      expect(page).to have_content("Hello, John Smith! To receive notifications when your parking is about to expire, please provide your phone number.")
      fill_in "Phone number", with: phone
      click_on "Save My Number"

      expect(current_path).to eq('/home')
      expect(user.phone_number).to eq(7175565567)
      expect(page).to have_content("Disable Notifications")
    end

    it 'I can opt out of notifications as soon as I log in' do
      user = User.create(uid: '1234', google_token: '4321', email: 'example@gmail.com', name: "John Smith")
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit '/home'

      click_on "Opt Out Of Notifications"

      expect(current_path).to eq('/home')
      expect(user.phone_number).to eq(nil)
      expect(user.contact).to eq(false)
      expect(page).to have_content("Enable Notifications")
    end

    it 'I can enable/disable my notifications after already logging in' do
      user = User.create(uid: '1234', google_token: '4321', email: 'example@gmail.com', name: "John Smith")
      phone = "7175565567"
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit '/home'

      click_on "Opt Out Of Notifications"
      click_on "Enable Notifications"

      expect(user.contact).to eq(true)
    end
  end
end
