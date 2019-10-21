class PostMailer < ApplicationMailer

  def send_when_post(post)
    # @user = user
    @post = post
    mail to: "hw.bm0122.wc@gmail.com", subject: "投稿の確認"
  end
end
