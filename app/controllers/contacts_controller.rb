class ContactsController < ApplicationController

 def new

  @contact = Contact.new

  respond_to do |format|
    format.js
  end
end

def create
  @contact = Contact.new(contact_params)

  if @contact.save
    ContactMailer.contact_message(@contact).deliver_now
    respond_to do |format|
      format.js
    end
  else
    render :new
  end
end




private

def contact_params
  params.require(:contact).permit(:name, :email, :subject, :message)
end


end
