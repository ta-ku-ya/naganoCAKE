class Admin::GenresController < ApplicationController


 def index
    @genres = Genre.all
    @genre = Genre.new

  end



  def create
    @genres = Genre.new(genres_params)

  if @genres.save


    flash[:notice]=" was successfully created."
     redirect_to admin_genres_path(@genres.id)
    else
     @genres = Genre.all
     render :index
    end
  end




  def edit
    @genres = Genre.all
    @genre = Genre.find(params[:id])

      render "edit"
  end

  def update
    @genres = Genre.find(params[:id])
    @genres.update(genres_params)
    if @genres.save


    flash[:notice]=" was successfully updated."

   redirect_to admin_genres_path(@genres.id)
    else
      render :edit
    end
   end

  private

  def genres_params


    params.require(:genre).permit(:name)
  end


  # def correct_admin
  #   @genres = Genres.find(params[:id])
  #   @admin = @Genres.admin


  #   redirect_to(_path) unless @admin == current_admin
  # end
end
