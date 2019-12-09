class TouchpointsController < ApplicationController
    def index
        @contact = current_user.contacts.find_by(id: params[:contact_id])
        @touchpoints = @contact.touchpoints.all
    end
    def show
        @contact = current_user.contacts.find_by(id: params[:contact_id])
        @touchpoint = @contact.touchpoints.find_by(id: params[:id])
    end
    def new
        @contact = current_user.contacts.find_by(id: params[:contact_id])
        @touchpoint = @contact.touchpoints.build
    end
    def create
        @contact = current_user.contacts.find_by(id: params[:contact_id])
        @touchpoint = @contact.touchpoints.build(touchpoint_params)
        add_contact_to_touchpoint
        add_user_to_touchpoint

        if @touchpoint.save
            redirect_to @contact
        else
            render 'new'
        end
    end
    def edit
        @contact = Contact.find_by(id: params[:contact_id])
        @touchpoint = Touchpoint.find_by(id: params[:id])
    end
    def update
        @contact = Contact.find_by(id: params[:contact_id])
        @touchpoint = Touchpoint.find_by(id: params[:id])

        if @touchpoint.update(touchpoint_params)
            redirect_to @contact
        else
            render 'edit'
        end
    end
private
    def touchpoint_params
        params.require(:touchpoint).permit(:date, :title, :details)
    end
    def add_contact_to_touchpoint
        @touchpoint.contact = @contact
    end
    def add_user_to_touchpoint
        @touchpoint.user = current_user
    end
end
