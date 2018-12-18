require 'rails_helper'

RSpec.describe Parking, type: :model do
  describe 'validations' do
    it {should validate_presence_of(:coord)}
    it {should validate_inclusion_of(:legal).in_array([true, false])}
    it {should validate_presence_of(:street_name)}
    it {should validate_presence_of(:start_cross_street)}
    it {should validate_presence_of(:end_cross_street)}
    it {should validate_presence_of(:side_of_street)}
  end

  describe 'relationships' do
    it {should belong_to(:user)}
  end

end
