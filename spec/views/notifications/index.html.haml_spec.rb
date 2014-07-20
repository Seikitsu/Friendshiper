require 'rails_helper'

RSpec.describe "notifications/index", :type => :view do
  before(:each) do
    assign(:notifications, [
      Notification.create!(
        :friend => "Friend"
      ),
      Notification.create!(
        :friend => "Friend"
      )
    ])
  end

  it "renders a list of notifications" do
    render
    assert_select "tr>td", :text => "Friend".to_s, :count => 2
  end
end
