class Admin::ItemsController < ApplicationController

  def index
    @item = Item.all
  end

  def new
    @item = Item.new
  end

  def create

    @item = Item.new(item_params)

    if@item.save
    flash[:notice]=" was successfully created."

    redirect_to admin_item_path(@item.id)
    else
    @item = Item.all
    render :index
    end
  end

  def show
    @item = Item.find(params[:id])


  end


  def edit
    @item = Item.find(params[:id])
    render "edit"
  end

  def update
    @item = Item.find(params[:id])
    @item.update(item_params)

    if @item.save
    flash[:notice]=" was successfully updated."
    redirect_to admin_item_path(@item.id)
    else
      render :edit
    end
  end

  # def destroy
  #   item = Item.find(params[:id])
  #   item.destroy
  #   redirect_to '/items'
  # end
  private

  def item_params
    params.require(:item).permit(:name, :introduction, :price)
  end
  # def correct_user
  #   @book = Book.find(params[:id])
  #   @user = @book.user
  #   redirect_to(books_path) unless @user == current_user
  # end
end
