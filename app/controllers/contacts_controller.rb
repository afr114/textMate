class ContactsController < ApplicationController

def index
  @contacts = Contact.all
end

def new
  @contact = Contact.new
end

def create
  @contact = Contact.new(contact_params)
if @contact.save
  flash[:notice] = "Contact was created!"
  redirect_to contacts_path
else
  render 'new'
  end
end

def show
  @contact = Contact.find(params[:id])
end

def edit
  @contact = Contact.find(params[:id])
end

def update
  @contact = Contact.find(params[:id])
  @contact.update(contact_params)
  flash[:notice] = "Update successful"
  redirect_to contacts_path
end

def destroy
  @contact.destroy()
  redirect_to contacts_path
end


private

def contact_params
  params.require(:contact).permit(:name, :phone_number, :message_id)
  end
end
