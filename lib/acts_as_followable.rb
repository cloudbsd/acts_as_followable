require 'active_support'
require 'active_model'
require 'active_record'

require "acts_as_followable/version"
require "acts_as_followable/following"
require "acts_as_followable/follower"

module ActsAsFollowable
  extend ActiveSupport::Concern

  included do
  end

  module ClassMethods
    def acts_as_followable
      has_many :follower_items, class_name: 'ActsAsFollowable::Following', foreign_key: 'followee_id', dependent: :destroy, :inverse_of => :followee
      has_many :followee_items, class_name: 'ActsAsFollowable::Following', foreign_key: 'follower_id', dependent: :destroy, :inverse_of => :follower
      has_many :followers, through: :follower_items, source: :follower
      has_many :followees, through: :followee_items, source: :followee
      include ActsAsFollowable::Follower::Methods
    end

  # def is_follower?
  #   false
  # end
  end
end


ActiveRecord::Base.send :include, ActsAsFollowable
