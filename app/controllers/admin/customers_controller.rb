class Admin::CustomersController < ApplicationController
  def index
    @customer = Customer.all
    @customer = Customer.new
  end

 


  def show
    @customer = Customer.find(params[:id])
    @customer = @customer.user

  end


  def edit
    @customer = Customer.find(params[:id])
    if customer.user == current_user
      render "edit"
    else
      redirect_to customer_path
    end
  end

  def update
    @customer = customer.find(params[:id])
    @customer.update(customer_params)

    if @customer.save
    flash[:notice]="Book was successfully updated."
    redirect_to customer_path(@customer.id)
    else
      render :edit
    end
   end

  def destroy
    customer = Customer.find(params[:id])
    customer.destroy
    redirect_to '/customers'
  end
  private

  def item_params
    params.require(:item).permit(:title, :body)
  end
  # def correct_user
  #   @book = Book.find(params[:id])
  #   @user = @book.user
  #   redirect_to(books_path) unless @user == current_user
  # end
end