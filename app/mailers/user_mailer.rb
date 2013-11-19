class UserMailer < ActionMailer::Base
  default from: "from@example.com"
 
  def welcome_email
    mail(to: "emilyxxie@gmail.com", subject: 'Welcome to My Awesome Site')
  end

end
