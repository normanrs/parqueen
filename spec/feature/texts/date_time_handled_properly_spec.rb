require 'rails_helper'

describe 'when user parks' do
  it 'it can show option to set expiration time' do
    user = User.create(uid: '1234', google_token: '4321', email: 'example@gmail.com', name: "John Smith", phone_number: 1234567890, contact: true)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit '/home'

    click_on "Park Here"

    if location == valid
      expect(page).to have_content("Set Expiration")

      click_on "Set Expiration"
      expect(current_path).to eq('/')
    elsif location != valid
      expect(page).to_not have_content("Set Expiration")
    end
  end

  it 'and parks in valid location, time is parsed correctly' do
    
  end
end
