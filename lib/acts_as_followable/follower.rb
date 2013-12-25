module ActsAsFollowable
  module Follower
    module Methods
      extend ActiveSupport::Concern

      self.included do
      end

   #  module ClassMethods
   #    def is_follower?
   #      true
   #    end
   #  end # module ClassMethods

      def following?(other)
        self.followees.include? other
      end

      def follow(other)
        self.followees << other
      end

      def unfollow(other)
        self.followees.destroy other
      # self.followees.delete other
      end
    end # module Methods
  end # module Follower
end # module ActsAsFollowable
