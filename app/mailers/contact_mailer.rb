class ContactMailer < ApplicationMailer

  def contact_message(contact)
    @contact = contact
    mail(to: 'fedde.leg@gmail.com', from: @contact.email, subject: @contact.subject)
  end
end
