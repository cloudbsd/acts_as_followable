module ActsAsFollowable
  class Following < ActiveRecord::Base
    belongs_to :follower, class_name: 'User', :inverse_of => :followee_items
    belongs_to :followee, class_name: 'User', :inverse_of => :follower_items

    validates :follower_id, presence: true
    validates :followee_id, presence: true
  end
end
