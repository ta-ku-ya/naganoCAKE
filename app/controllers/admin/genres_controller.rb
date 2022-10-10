class Admin::GenresController < ApplicationController


  def index
    @genres = Genres.all
    @genres = Genres.new
  end



  def create
    @genres = Genres.new(genres_params)


    @genres._id = current_admin.id
    if @genres.save


    flash[:notice]=" was successfully created."



     redirect_to _path(@genres.id)
    else
     @genres = Genres.all
     render :index
    end
  end




  def edit
    @genres = Genres.find(params[:id])


    if @genres.admin == current_admin
      render "edit"
    else



      redirect_to books_path
    end
  end

  def update
    @genres = Genres.find(params[:id])
    @genres.update(genres_params)
    if @genres.save


    flash[:notice]=" was successfully updated."




    redirect_to genres_path(@genres.id)
    else
      render :edit
    end
   end

  private

  def genres_params


    params.require(:genres).permit(:title, :body)
  end


  def correct_admin
    @genres = Genres.find(params[:id])
    @admin = @Genres.admin


    redirect_to(_path) unless @admin == current_admin
  end
end
