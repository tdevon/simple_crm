class SalesController < ApplicationController
    def index
        @sales = current_user.sales.all.sort_by(&:date).reverse!
        sort_sales
    end
    def show
        @sale = current_user.sales.find_by(id: params[:id])
        @contact = Contact.find_by(id: @sale.contact_id)
    end
    def new
        @sale = current_user.sales.build
    end
    def create
        @sale = current_user.sales.build(sale_params)
        if @sale.save
            redirect_to @sale
        else
            flash.now["notice"] = "Couldnt create sale."
            render 'new'
        end
    end
    def edit
        @sale = current_user.sales.find_by(id: params[:id])
    end
    def update
        @sale = current_user.sales.find_by(id: params[:id])
        if @sale.update(sale_params)
            redirect_to @sale
        else
            flash.now["error"] = @sale.errors.full_messages
            render 'edit'
        end
    end
    def add_contact
        @sale = current_user.sales.find_by(id: params[:id])
        @contacts = current_user.contacts.all
    end
private
    def sale_params
        params.require(:sale).permit(:price, :date, :title, :description, :contact_id)
    end
    def sort_sales
        if params[:sort].present?
            if params[:sort] == "recent"
                @sales = @sales.sort_by(&:date).reverse!
            end
            if params[:sort] == "amount"
                @sales = @sales.sort_by(&:price).reverse!
            end
        end
    end
end
