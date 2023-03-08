class OthersController < ApplicationController
    def index
        @others = Other.all
    end
    
    def new
        @other = Other.new
    end
    
    def create
        other = Other.new(other_params)
        if other.save!
            redirect_to :action => "index"
        else
            redirect_to :action => "new"
        end
    end

    def show
        @other = Other.find(params[:id])
    end

    def edit
        @other = Other.find(params[:id])
    end

    def update
        other = Other.find(params[:id])
        if other.update(other_params)
          redirect_to :action => "show", :id => other.id
        else
          redirect_to :action => "new"
        end
    end

    def destroy
        other = Other.find(params[:id])
        other.destroy
        redirect_to action: :index
    end
    
    private
    def other_params
        params.require(:other).permit(:song, :singer, :text, :voice, :movie)
    end
end
