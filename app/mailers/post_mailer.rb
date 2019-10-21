class PostMailer < ApplicationMailer
  def contact_mail(contact)
    @contact = contact

    mail to: "hw.bm0122.wc@gmail.com", subject: "投稿の確認メール"
  end
end
