require 'test_helper'

class PostMailerTest < ActionMailer::TestCase
  test "send_when_post" do
    mail = PostMailer.send_when_post
    assert_equal "Send when post", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
