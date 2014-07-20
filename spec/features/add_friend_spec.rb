require 'rails_helper'

RSpec.describe "add friend process",:js => true, :type => :feature do

  user1 = FactoryGirl.create(:user)
  user2 = FactoryGirl.create(:user)
  
  it "sends request of user no 1 and user no 2 accepts" do
    visit '/users/sign_in'
    within("form") do
      fill_in 'Email', :with => 'person1@example.com'
      fill_in 'Password', :with => 'p4ssw0rd'
    end
    click_button 'Sign in'
    click_link(2)
    expect(page).to have_content 'Friendship request sent'
    click_link('Logout')

    visit '/users/sign_in'
    within("form") do
      fill_in 'Email', :with => 'person2@example.com'
      fill_in 'Password', :with => 'p4ssw0rd'
    end
    click_button 'Sign in'
    expect(page).to have_content 'Friendship request!'
  end
end