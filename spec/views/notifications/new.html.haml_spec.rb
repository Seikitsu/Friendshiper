require 'rails_helper'

RSpec.describe "notifications/new", :type => :view do
  before(:each) do
    assign(:notification, Notification.new(
      :friend => "MyString"
    ))
  end

  it "renders new notification form" do
    render

    assert_select "form[action=?][method=?]", notifications_path, "post" do

      assert_select "input#notification_friend[name=?]", "notification[friend]"
    end
  end
end
