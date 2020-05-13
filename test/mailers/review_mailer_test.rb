require 'test_helper'

class ReviewMailerTest < ActionMailer::TestCase
  test "review_notification" do
    mail = ReviewMailer.review_notification
    assert_equal "Review notification", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

  test "send_review" do
    mail = ReviewMailer.send_review
    assert_equal "Send review", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
