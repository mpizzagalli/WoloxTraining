class MailerWorker
  include Sidekiq::Worker

  def perform(user_id)
    articles = Article.order(created_at: :desc).limit(10)
    user = User.find(user_id)
    AdminMailer.last_articles_async(user, articles).deliver
  end
end
