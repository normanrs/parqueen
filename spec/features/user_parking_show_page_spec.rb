require 'rails_helper'

describe 'when a user creates a parking show page by button press' do
  it 'if parking is legal page displays location info' do
    params = {:location => "47.539245692589986,-122.29951946605416"}
    parking_1 = create(:parking)
    visit parking_path(params)

    expect(current_path).to eq(parking_path)
    expect(page).to have_content("YOU PARKED YOUR CHARIOT LEGALLY!")
    expect(page).to have_content(parking_1.street_name)
    expect(page).to have_content(parking_1.start_cross_street)
    expect(page).to have_content(parking_1.end_cross_street)
    expect(page).to have_content(parking_1.side_of_street)
    expect(page).to have_content("Start Time: #{parking_1.start_time}")
    expect(page).to have_button("Cancel Parking")
# I see a detailed description of where I parked
# (Example: You parked on the SE side of Maple Avenue between 14th street and 15th street".
# And I see the time I parked

# and the time I should move my car


  end

end
