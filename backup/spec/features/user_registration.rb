require "spec_helper"

feature 'User registration' do
  scenario 'they sing up' do
    visit '/users/sign_up'

    expect(page).to have_content('Sign up')

    fill_in 'Email', with: 'test@gmail.com'
    fill_in 'Password', with: 'heslo1234'
    fill_in 'Password confirmation', with: 'heslo1234'

    click_button 'Sign up'

    #expect(page).to have_css '.foobar-name', 'My foobar'
  end
end