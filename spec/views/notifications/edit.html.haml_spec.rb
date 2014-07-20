require 'rails_helper'

RSpec.describe "notifications/edit", :type => :view do
  before(:each) do
    @notification = assign(:notification, Notification.create!(
      :friend => "MyString"
    ))
  end

  it "renders the edit notification form" do
    render

    assert_select "form[action=?][method=?]", notification_path(@notification), "post" do

      assert_select "input#notification_friend[name=?]", "notification[friend]"
    end
  end
end
