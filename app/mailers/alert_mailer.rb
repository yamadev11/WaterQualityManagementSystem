class AlertMailer < ApplicationMailer
  def alert_mail
    mail(to: 'ymaheshwari99@gmail.com', subject: 'Welcome to My Awesome Site')
  end
end
