class PostMailer < ApplicationMailer

  def send_when_post(user)
    @user = user
    mail to: "hw.bm0122.wc@gmail.com", subject: "投稿の確認"
  end
end
