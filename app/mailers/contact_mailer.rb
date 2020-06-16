class ContactMailer < ApplicationMailer

  def contact
    mail(to: 'contact@test.fr', subject: 'test')
  end
end
