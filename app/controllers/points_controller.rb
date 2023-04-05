class PointsController < ApplicationController

    def new
        @point = Point.new
    end

    def create
        point = Point.new(point_params)
        point.user_id = current_user.id 
        tag_list = params[:point][:tag_maps].split(" ")

        if point.save
            @point.save_tag(tag_list)
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
            @tag_list = Tag.all 
        end
    end

    def show
        @point = Point.find(params[:id])
        @point_tags = @point.tags 
    end

    def edit
        @point = Point.find(params[:id])
        @tag_list=@point.tags.pluck(:tag_name).join(nil)
    end

    def update
        point = Point.find(params[:id])
        tag_list = params[:point][:tag_name].split(nil)

        if point.update(point_params)
            old_relations = TagMap.where(point_id: point.id)
            old_relations.each do |relation|
                relation.delete
            end
            point.save_tag(tag_list)
            redirect_to point_path(point.id), notice:'投稿完了しました:)'
        else
            redirect_to :action => "edit"
        end
    end

    def destroy
        point= Point.find(params[:id])
        point.destroy
        redirect_to action: :index
    end

    def search
        @tag_list = Tag.all               # こっちの投稿一覧表示ページでも全てのタグを表示するために、タグを全取得
        @tag = Tag.find(params[:tag_id])  # クリックしたタグを取得
        @points = @tag.points.all           # クリックしたタグに紐付けられた投稿を全て表示
    end


    private
    def point_params
        params.require(:point).permit(:song, :point, :image, :start_time, :singer)
    end
    
end
