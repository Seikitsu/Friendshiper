require 'rails_helper'

RSpec.describe "the signin process", :type => :feature do

  user1 = FactoryGirl.create(:user)
  user2 = FactoryGirl.create(:user)
  
  it "signs in" do
    visit '/users/sign_in'
    within("form") do
      fill_in 'Email', :with => 'person1@example.com'
      fill_in 'Password', :with => 'p4ssw0rd'
    end
    click_button 'Sign in'
    expect(page).to have_css '#user-friends'
    expect(page).to have_link 'Add friend'
  end
end
