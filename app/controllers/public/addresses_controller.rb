class Public::AddressesController < ApplicationController
  def index
    @addresses = Addresses.all
    @addresse = Addresse.new
  end


  def create
    @addresses = Addresses.new(book_params)
    @addresses.save

     render :index

  end

  def edit
    @addresses = Addresses.find(params[:id])

      render "edit"
  end

  def update
    @addresses = Addresses.find(params[:id])
    @addresses.update(book_params)
    @book.save

      render :edit
   end

  def destroy
    addresses = Addresses.find(params[:id])
    addresses.destroy
    redirect_to '/addresses'
  end
  private

  def addresses_params
    params.require(:book).permit(:title, :body)
  end
  # def correct_user
  #   @book = Book.find(params[:id])
  #   @user = @book.user
  #   redirect_to(books_path) unless @user == current_user
  # end
end
