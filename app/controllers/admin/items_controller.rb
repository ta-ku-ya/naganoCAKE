class Admin::ItemsController < ApplicationController

  def index
    @admin = Genres.all
    @genres = Genres.new
  end

  def new
    @genres = Genres.new
  end

  def create
    @genres = Genres.new(book_params)
    @genres.user_id = current_user.id
    if @genres.save
    flash[:notice]="Book was successfully created."

     redirect_to book_path(@genres.id)
    else
     @genres = Genres.all
     render :index
    end
  end

  def show
    @genres = Genres.find(params[:id])
    @admin = @genres.user

  end


  def edit
    @genres = Genres.find(params[:id])
    if @genres.user == current_user
      render "edit"
    else
      redirect_to books_path
    end
  end

  def update
    @genres = Genres.find(params[:id])
    @genres.update(book_params)

    if @book.save
    flash[:notice]="Book was successfully updated."
    redirect_to book_path(@book.id)
    else
      render :edit
    end
   end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to '/books'
  end
  private

  def book_params
    params.require(:book).permit(:title, :body)
  end
  def correct_user
    @book = Book.find(params[:id])
    @user = @book.user
    redirect_to(books_path) unless @user == current_user
  end
end
