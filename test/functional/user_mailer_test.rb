require 'test_helper'

class UserMailerTest < ActionMailer::TestCase
  test "signup_confirmation" do
    mail = UserMailer.signup_confirmation
    assert_equal "Signup confirmation", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

  test "reset_password" do
    mail = UserMailer.reset_password
    assert_equal "Reset password", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

  test "mhwow_add_program" do
    mail = UserMailer.mhwow_add_program
    assert_equal "Mhwow add program", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

  test "mhwow_register" do
    mail = UserMailer.mhwow_register
    assert_equal "Mhwow register", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

  # test "mhwow_programs_approved" do
  #   mail = UserMailer.mhwow_programs_approved
  #   assert_equal "Mhwow programs approved", mail.subject
  #   assert_equal ["to@example.org"], mail.to
  #   assert_equal ["from@example.com"], mail.from
  #   assert_match "Hi", mail.body.encoded
  # end

end
