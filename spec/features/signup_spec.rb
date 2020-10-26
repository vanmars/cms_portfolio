require 'rails_helper'

describe 'register process with registered user' do
  it 'signs in a registered user' do
    visit '/'
    click_link 'Sign Up'
    fill_in 'First name', with: 'Ada'
    fill_in 'Last name', with: 'Lovelace'
    fill_in 'Username', with: 'alovelace'
    fill_in 'Email', with: 'spectest@email.com'
    fill_in 'Password', with: 'password'
    fill_in 'Password confirmation', with: 'password'
    click_on 'Sign up'
    expect(page).to have_content('Welcome')
  end
end