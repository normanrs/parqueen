require 'rails_helper'

describe 'as a visitor' do
  it 'I can see welcome screen' do
    visit "/"

    expect(page).to have_content('ParQueen')
    expect(page).to have_link('Log in with Google')
  end

  # it 'Can log in with google' do
  #   visit '/'
  #   click_on "Log in with Google"
  #
  #   expect(current_path).to
  # end
end
