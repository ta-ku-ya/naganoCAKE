class Public::CustomersController < ApplicationController
 def index
    @customer = Customer.page(params[:page])

  end


  def show
    @customer = Customer.find(params[:id])

  end


  def edit
    @customer = Customer.find(params[:id])

      render "edit"
  end

  def update
    @customer = customer.find(params[:id])
    @customer.update(customer_params)

    if @customer.save
    flash[:notice]=" was successfully updated."
    redirect_to customer_path(@customer.id)
    else
      render :edit
    end
   end


  private

  def customer_params
    params.require(:customer).permit(:customer_id, :email, :name, :postal_code, :address, :telephone_number)
  end


end
