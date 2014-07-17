class Friendship < ActiveRecord::Base
	enum status: %w(none pending approved)
end
