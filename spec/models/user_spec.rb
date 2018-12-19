require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    it {should validate_presence_of(:email)}
    it {should validate_uniqueness_of(:email)}
    it {should validate_presence_of(:google_token)}
    it {should validate_presence_of(:uid)}
    it {should validate_presence_of(:name)}
  end

  it 'creates itself from an oauth hash' do
    auth = {uid: "1234",info: {email: "johnsmith@example.com",name: "John Smith"}, credentials: {token: "4321"}}

    new_user = User.update_or_create(auth)

    expect(new_user.uid).to eq('1234')
    expect(new_user.email).to eq('johnsmith@example.com')
    expect(new_user.name).to eq('John Smith')
    expect(new_user.google_token).to eq('4321')

  end
end
