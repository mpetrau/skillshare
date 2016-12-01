class UserMailerPreview < ActionMailer::Preview
  def welcome
    user = User.first
    UserMailer.welcome(user)
  end
  
  def make_booking
    user= User.last
    UserMailer.make_booking(user)
  end
  
  def someone_booked
    user= User.first
    UserMailer.someone_booked(user)
  end
end