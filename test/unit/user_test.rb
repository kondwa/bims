require File.dirname(__FILE__)+'/../test_helper'

class UserTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  def test_truth
    assert true
  end
  def test_salt_starts_with_object_id
    user = User.new
    salt = user.create_salt
    object_id = user.object_id.to_s
    assert salt.starts_with? object_id , "Salt must identify with Object"
  end
  def test_salt_is_unique
    user1=User.new
    user2=User.new
    assert_not_equal user1.create_salt , user2.create_salt, "Salt must be unique"
  end
  def test_salt_is_string
    user = User.new
    salt = user.create_salt
    assert_equal(salt.class, String, "Salt is must be a String")
  end 
end
