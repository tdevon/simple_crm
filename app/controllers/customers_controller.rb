class CustomersController < ApplicationController
    def index
        @customers = current_user.customers.all
    end
    def show
        @customer = current_user.customers.find_by(id: params[:id])
    end
    def new
        @customer = current_user.customers.build
    end
    def create
        @customer = current_user.customers.build(customer_params)
        if @customer.save
            redirect_to @customer
        else
            flash.now["notice"] = "Unable to build."
            render new
        end
    end
    def edit
        @customer = current_user.customers.find_by(id: params[:id])
    end
    def update
        @customer = current_user.customers.find_by(id: params[:id])
        if @customer.update(customer_params)
            redirect_to @customer
        else
            flash.now["notice"] = "Unable to update."
            render 'edit'
        end
    end
private
    def customer_params
        params.require(:customer).permit(:name, :email, :phone)
    end
end
