class Friendship < ActiveRecord::Base
	belongs_to :user
	enum status: %w(enemies pending approved)

  def from(user)
    self.user_id == user.id
  end
end
