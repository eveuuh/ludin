require 'test_helper'

class ParticipationMailerTest < ActionMailer::TestCase
  test "cancelation_notice" do
    mail = ParticipationMailer.cancelation_notice
    assert_equal "Cancelation notice", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
