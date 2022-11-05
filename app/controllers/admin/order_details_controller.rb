class Admin::OrderDetailsController < ApplicationController

  def update
    @order_details = order_details.find(params[:id])
    @order_details.update(customer_params)

    if @customer.save
    flash[:notice]="Book was successfully updated."
    redirect_to customer_path(@customer.id)
    else
      render :edit
    end
   end
end
