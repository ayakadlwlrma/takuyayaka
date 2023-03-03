class OthersController < ApplicationController
    def index
        @others = Other.all
    end
    def new
        @other = Other.new
    end
    
    def create
        other = Other.new(other_params)
        if othre.save!
            redirect_to :action => "index"
        else
            redirect_to :action => "new"
        end
    end

    def show
        @tweet = Tweet.find(params[:id])
    end
    
    private
    def other_params
        params.require(:other).permit(:song, :singer, :text, :voice, :movie)
    end
end
