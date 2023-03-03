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

end
