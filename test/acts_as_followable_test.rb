require 'test_helper'

class ActsAsFollowableTest < ActiveSupport::TestCase
  setup do
    2.times do |i|
      User.create(name: "follower#{i}")
    end
    2.times do |i|
      User.create(name: "followee#{i}")
    end
  end

  test "truth" do
    assert_kind_of Module, ActsAsFollowable
  end

  test "acts_as_followable method is available" do
    assert User.respond_to? :acts_as_followable
  end

  test "follow method is available" do
    follower1 = User.first
    assert follower1.respond_to? :following?
    assert follower1.respond_to? :follow
    assert follower1.respond_to? :unfollow
  end

  test "following relationship work" do
    follower1 = User.all[0]
    follower2 = User.all[1]
    followee1 = User.all[2]
    followee2 = User.all[3]

    # follower1 -> followee1, follower2 -> followee2
    follower1.follow(followee1)
    follower2.follow(followee2)

    assert follower1.following?(followee1)
    assert follower2.following?(followee2)
    assert_not follower1.following?(followee2)
    assert_not follower2.following?(followee1)
    assert_equal 2, ActsAsFollowable::Following.count

    # follower1 -> followee2, follower2 -> followee1
    follower1.follow(followee2)
    follower2.follow(followee1)

    assert follower1.following?(followee1)
    assert follower2.following?(followee2)
    assert follower1.following?(followee2)
    assert follower2.following?(followee1)
    assert_equal 4, ActsAsFollowable::Following.count

    follower1.unfollow(followee1)
    assert !follower1.following?(followee1)
    assert follower2.following?(followee2)
    assert follower1.following?(followee2)
    assert follower2.following?(followee1)
    assert_equal 3, ActsAsFollowable::Following.count
  end
end
