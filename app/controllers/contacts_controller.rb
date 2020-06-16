class ContactsController < ApplicationController

 def new

  @contact = Contact.new

  respond_to do |format|
    format.js
  end
end



private

def contact_params
  params.require(:contact).permit(:name, :email, :subject, :message)
end


end
