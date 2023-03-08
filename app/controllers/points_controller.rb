class PointsController < ApplicationController

    def new
        @point = Point.new
    end

    def create
        point = Point.new(point_params)
        point.user_id = current_user.id  #追記

        if point.save
            redirect_to :action => "index"
        else
            redirect_to :action => "new"
        end
    end

    def index
        @points = Point.all
    end

    def show
        @point = Point.find(params[:id])
    end

    def edit
        @point = Point.find(params[:id])
    end

    def update
        point = Point.find(params[:id])
        if point.update(point_params)
            redirect_to :action => "show", :id => point.id
        else
            redirect_to :action => "new"
        end
    end

    def destroy
        point= Point.find(params[:id])
        point.destroy
        redirect_to action: :index
    end

    private
    def point_params
        params.require(:point).permit(:song, :point, :image)
    end
    
end
