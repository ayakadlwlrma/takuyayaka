class GenresController < ApplicationController
    def new
        @genre = Genre.new
    end

    def create
        genre = Genre.new(genre_params)
        if genre.save
            redirect_to :action => "index"
        else
            redirect_to :action => "new"
        end
    end

    def index
        @genres = Genre.all
    end

    def show
        @genre = Genre.find(params[:id])
    end

    private
    def genre_params
        params.require(:genre).permit(:song, :singer)
    end

end
