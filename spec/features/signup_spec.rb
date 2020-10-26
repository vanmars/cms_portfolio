require 'rails_helper'

describe 'register process with registered user' do
  it 'signs in a registered user' do
    visit '/'
    click_link 'Sign Up'
    fill_in 'Email', with: 'test@email.com'
    fill_in 'Password', with: 'password'
    fill_in 'Password confirmation', with: 'password'
    click_on 'Sign Up'
    expect(page).to have_content('Welcome')
  end
end

# describe 'register process with already registered user' do
#   it 'signs in a registered user' do
#     visit '/'
#     click_link 'Sign In'
#     fill_in 'Email', with: 'test20@email.com'
#     fill_in 'Password', with: 'password'
#     click_on 'Log in'
#     expect(page).to have_content('Invalid')
#   end
end