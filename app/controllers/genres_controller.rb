class GenresController < ApplicationController
    def index
        @genres = Genre.all
    end
    
    def new
        @genre = Genre.new
    end

    def create
        genre = Genre.new(genre_params)
        genre.user_id = current_user.id
        
        if genre.save!
            redirect_to :action => "index"
        else
            redirect_to :action => "new"
        end
    end

    def show
        @genre = Genre.find(params[:id])
    end

    def edit
        @genre = Genre.find(params[:id])
    end

    def update
        genre = Genre.find(params[:id])
        if genre.update(genre_params)
            redirect_to :action => "index", :id => genre.id
        else
            redirect_to :action => "new"
        end
    end

    def destroy
        genre = Genre.find(params[:id])
        genre.destroy
        redirect_to action: :index
    end

    private
    def genre_params
        params.require(:genre).permit(:song, :singer)
    end

end
