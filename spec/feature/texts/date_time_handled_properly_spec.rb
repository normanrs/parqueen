require 'rails_helper'

describe 'when user parks' do
  it 'it can show option to set expiration time' do
    user = User.create(uid: '1234', google_token: '4321', email: 'example@gmail.com', name: "John Smith", phone_number: 1234567890, contact: true)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit '/home'

    expect(page).to have_button("Set Expiration")
  end

  it 'doesnt show option to set expiration if disabled notifications' do
    user = User.create(uid: '1234', google_token: '4321', email: 'example@gmail.com', name: "John Smith", phone_number: 1234567890, contact: false)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit '/home'

    expect(page).to_not have_button("Set Expiration")
  end

  it 'handles time correctly with TwilioFacade' do
    user = User.create(uid: '1234', google_token: '4321', email: 'example@gmail.com', name: "John Smith", phone_number: 1234567890, contact: false)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    twilio = TwilioFacade.new(user,Time.now)
    time = twilio.expiration_time

    expect(twilio.initial_message).to eq("John Smith, thank you for using ParQueen. We will notify you fifteen minutes before your parking expires.")
    expect(twilio.expiration_message).to eq("Your parking will expire in 15 minutes. You have until #{time} to move your vehicle.")
  end
end
