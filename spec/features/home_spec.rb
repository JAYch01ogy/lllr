require 'rails_helper'

describe 'Home', feature: true do
  before do
    visit '/'
  end

  it 'displays the home page' do
    expect(page).to have_content('Home')
    expect(page).to have_link('Sign up')
    expect(page).to have_link('Login')
    expect(page).to have_link('Get a Quote')
    expect(page).to have_link('Quotes')
    expect(page).to have_link('Facebook')
    expect(page).to have_link('Twitter')
  end
end
