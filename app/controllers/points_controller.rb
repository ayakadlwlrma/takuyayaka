class PointsController < ApplicationController

    def new
        @point = Point.new
    end

    def create
        point = Point.new(point_params)
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

    private
    def point_params
        params.require(:point).permit(:song, :point, :image)
    end

end
