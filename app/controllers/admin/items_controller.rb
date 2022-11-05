class Admin::ItemsController < ApplicationController

  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create

    @item = Item.new(item_params)
    # @item.user_id = current_user.id
    if@item.save
    flash[:notice]="Book was successfully created."

    redirect_to admin_items_path
    else
    @item = Item.all
    render :index
    end
  end

  # def show
  #   @item = Item.find(params[:id])
  #   @item = @item.user

  # end


  # def edit
  #   @item = Item.find(params[:id])
  #   if item.user == current_user
  #     render "edit"
  #   else
  #     redirect_to items_path
  #   end
  # end

  # def update
  #   @item = Item.find(params[:id])
  #   @item.update(items_params)

  #   if @item.save
  #   flash[:notice]="Book was successfully updated."
  #   redirect_to item_path(@item.id)
  #   else
  #     render :edit
  #   end
  # end

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
