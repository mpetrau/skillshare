class UserMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.welcome.subject
  #
  def welcome(user)
    @user= user
    @greeting = "Thanks for joining Skillshare"

    mail(to: @user.email, subject: "Welcome to Skillshare")
  end
  
  def make_booking(user)
    @user= user
    @greeting = "Your recent booking with skilshare:"
    mail(to: @user.email, subject: "Booking confirmation with skillshare")
  end
  
  def someone_booked(user)
    @user= user
    mail(to: @user.email, subject:"Someone booked your class!")
  end

end
