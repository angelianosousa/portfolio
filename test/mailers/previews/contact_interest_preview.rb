class MailContactMailerPreview < ActionMailer::Preview
  def contact_interest
    @name = "Antonio da Silva"
    @email = "example@gmail.com"
    @phone = "(85) 9 9602-9676"
    @message = "Lorem ipsum dolor Lorem ipsum dolor Lorem ipsum dolor Lorem ipsum dolor Lorem ipsum dolor Lorem ipsum dolor Lorem ipsum dolor Lorem ipsum dolor Lorem ipsum dolor Lorem ipsum dolor Lorem ipsum dolor Lorem ipsum dolor"
    MailContactMailer.with(name: @name, email: @email, phone: @phone, message: @message).contact_interest
  end
end
