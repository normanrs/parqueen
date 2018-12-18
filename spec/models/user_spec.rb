require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    it {should validate_presence_of(:email)}
    it {should validate_uniqueness_of(:email)}
    it {should validate_presence_of(:google_token)}
  end

  describe 'relationships' do
    it {should have_many(:parkings)}
  end
end
