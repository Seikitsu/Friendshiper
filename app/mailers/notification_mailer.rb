class NotificationMailer < ActionMailer::Base
  default from: "info@friendshiper.com"

  def notification_mailer(notification)
    @notification = notification
    mail(:subject => "New Notification")
  end

end
