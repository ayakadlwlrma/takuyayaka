class PointsController < ApplicationController

    def new
        @point = Point.new
    end

    def create
        point = Point.new(point_params)
        point.user_id = current_user.id 

        if point.save
            redirect_to :action => "index"
        else
            redirect_to :action => "new"
        end
    end

    def index
        if params[:search] != nil && params[:search] != ''
            #部分検索かつ複数検索
            search = params[:search]
            @points = Point.where("song LIKE ? OR point LIKE ?", "%#{search}%", "%#{search}%")
        else
            @points = Point.all
        end
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
        params.require(:point).permit(:song, :point, :image, :start_time, :singer)
    end
    
end
