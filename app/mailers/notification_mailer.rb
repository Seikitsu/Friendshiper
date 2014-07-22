class NotificationMailer < ActionMailer::Base
  default from: "info@friendshiper.com"

  def notification_mailer(notification)
    @notification = notification
    mail(:to => "example@example.com", :subject => "New Notification")
  end

end
