class AdminMailer < ActionMailer::Base
  default from: "mail+tester@wolox.com.ar"
  def last_articles(user)
    @user = user
    @articles = Article.order(created_at: :desc).limit(10)
    mail(subject: "Last articles posted", to: user[:email])
  end
end
