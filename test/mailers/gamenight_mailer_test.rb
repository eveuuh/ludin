require 'test_helper'

class GamenightMailerTest < ActionMailer::TestCase
  test "cancelation_notice" do
    mail = GamenightMailer.cancelation_notice
    assert_equal "Cancelation notice", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
