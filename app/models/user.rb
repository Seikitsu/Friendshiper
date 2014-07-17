class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :friendships
  has_many :friends, through: :friendships, class_name: "User"

  def friendship_to(user)
    self.friendships.where(friend_id: user.id).first
  end
end
