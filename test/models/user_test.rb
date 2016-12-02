require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.new(name: "Adam", email: "adam@example.com",
                    password: "adamIshere", password_confirmation: "adamIshere")
  end

  test "can create a user" do
    assert @user.save
  end

  test "name should be present" do
    @user.name = ""
    assert_not @user.save
  end

  test "email should be present" do
    @user.email = "     "
    assert_not @user.save
  end

  test "email should have valid format" do
    @user.email = "hello@.com"
    assert_not @user.save
  end

  test "email address should be unique" do
    @user.email = users(:lisa).email
    assert_not @user.save
  end

  test "password should be present" do
    @user.password = " "
    @user.password_confirmation = " "
    assert_not @user.save
  end

  test "password should be of minimum length" do
    @user.password = "1234"
    @user.password_confirmation = "1234"
    assert_not @user.save
  end
end
