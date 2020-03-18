class ContactUsMailer < ApplicationMailer
  default :from => "from@example.com"

  def welcome_email(info)
    @msg_info = info
    mail(from: info[:email], :to => 'abroadinquiry.bd@gmail.com', :subject => "Welcome to My Awesome Site")
  end
end
