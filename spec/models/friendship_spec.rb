require 'rails_helper'

RSpec.describe Friendship, :type => :model do
  user1 = FactoryGirl.build(:user)
  user2 = FactoryGirl.build(:user)
  friendship = Friendship.create!(user_id: user1.id, friend_id: user2.id)
  friendship.pending!
  status = friendship.status
  status.should == 'pending'
end
