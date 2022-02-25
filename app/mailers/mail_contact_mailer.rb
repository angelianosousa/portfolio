class MailContactMailer < ApplicationMailer
  def contact_interest
    @name = params[:name]
    @email = params[:email]
    @phone = params[:phone]
    @message = params[:message]
    mail(to: "angeliano.sousa@gmail.com", subject: 'Novo contato chegando do site')
  end
end
