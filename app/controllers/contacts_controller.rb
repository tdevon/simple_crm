class ContactsController < ApplicationController
    def index
        @contacts = current_user.contacts.all
    end
    def show
        @contact = current_user.contacts.find_by(id: params[:id])
        @sales = @contact.sales.all
        @sales = @sales.sort_by(&:date).reverse!
    end
    def new
        @contact = current_user.contacts.build
    end
    def create
        @contact = current_user.contacts.build(contact_params)
        if @contact.save
            redirect_to @contact
        else
            flash.now["error"] = @contact.errors.full_messages
            render 'new'
        end
    end
    def edit
        @contact = current_user.contacts.find_by(id: params[:id])
    end
    def update
        @contact = current_user.contacts.find_by(id: params[:id])
        if @contact.update(contact_params)
            redirect_to @contact
        else
            flash.now["error"] = @contact.errors.full_messages
            render 'edit'
        end
    end
private
    def contact_params
        params.require(:contact).permit(:name, :email, :phone, :contact)
    end
end
