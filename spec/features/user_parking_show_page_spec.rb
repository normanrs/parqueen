require 'rails_helper'

describe 'when a user creates a parking show page by button press' do
  it 'if parking is legal page displays location info' do
    params = {:location => "37.802756844713855,-122.40579354398695"}
    visit parking_path(params)

    expect(current_path).to eq(parking_path)
    expect(page).to have_content("YOU PARKED YOUR CHARIOT LEGALLY!")
    expect(page).to have_content("Telegraph Hill Boulevard")
    expect(page).to have_content("DEAD END")
    expect(page).to have_content("Lombard Street")
    expect(page).to have_content("NE")
  end

  it 'if parking is not legal page displays location info' do
    params = {:location => "37.79974763215206,-122.40737978313376"}
    visit parking_path(params)

    expect(current_path).to eq(parking_path)
    expect(page).to have_content("YOU CANNOT LEGALLY PARK HERE!")
    expect(page).to have_content("Grant Avenue")
    expect(page).to have_content("Green Street")
    expect(page).to have_content("Union Street")
    expect(page).to have_content("E")
  end

end
# These are coordinates where you can't park
# params = {:location => "47.539245692589986,-122.29951946605416"}

# I see a detailed description of where I parked
# (Example: You parked on the SE side of Maple Avenue between 14th street and 15th street".
# And I see the time I parked
# and the time I should move my car
