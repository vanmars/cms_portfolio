require 'rails_helper'

describe 'sign in process with registered user' do
  it 'signs in a registered user' do
    visit '/'
    click_link 'Sign In'
    fill_in 'Email', with: 'test@email.com'
    fill_in 'Password', with: 'password'
    click_on 'Log in'
    click_on 'Home'
    expect(page).to have_content('Welcome')
  end
end

describe 'sign in process with unregistered user' do
  it 'signs in a registered user' do
    visit '/'
    click_link 'Sign In'
    fill_in 'Email', with: 'test20@email.com'
    fill_in 'Password', with: 'password'
    click_on 'Log in'
    expect(page).to have_content('Invalid')
  end
end