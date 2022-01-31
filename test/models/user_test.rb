require "test_helper"

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "should not register a user without an email" do
    user = User.new
    assert_not user.save, "Registered the user without an email"
  end

  test "should not register a user without a password" do
    user = User.new
    assert_not user.save, "Registered the user without an email"
  end

  test "should register a valid user" do
    user = User.new(email: "amruta@gmail.com", password: "amruta")
    assert user.save, "Registered the user with an email address and password"
  end

  test "should not allow duplicate email address" do
    user1 = User.create(email: "amruta@gmail.com", password: "amruta")
    user2 = User.new(email: "amruta@gmail.com", password: "password")
    user1.save
    assert_not user2.save, "Registered users with an duplicate email address"
  end

  test "should not register a user with invalid email format" do
    user = User.new(email: "amruta", password: "amruta")
    assert_not user.save, "Registered the user with invalid email format"
  end

end
