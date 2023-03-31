class GenresController < ApplicationController
    def index
        @genres = Genre.all
        @tag_list = Tag.all 
    end
    
    def new
        genre = Genre.new
    end

    def create
        genre = Genre.new(genre_params)
        genre.user_id = current_user.id
        tag_list = params[:genre][:tag_name].nil&.split(",")

        if genre.save!
            genre.save_tag(tag_list) 
            redirect_to :action => "index"
        else
            redirect_to :action => "new"
        end
    end

    def show
        @genre = Genre.find(params[:id])
        @genre_tags = @genre.tags 
    end

    def edit
        @genre = Genre.find(params[:id])
        @tag_list=@genre.tags.pluck(:tag_name).join(nil)
    end

    def update
        genre = Genre.find(params[:id])
        tag_list = params[:genre][:tag_name].split(nil)

        if genre.update(genre_params)
            old_relations = TagMap.where(genre_id: genre.id)
            old_relations.each do |relation|
                relation.delete
            end

            genre.save_tag(tag_list)
            redirect_to _path(genre.id), notice:'投稿完了しました:)'
        else
            redirect_to :action => "edit"
        end
        genre = Genre.find(params[:id])
        genre.destroy
        redirect_to action: :index
    end

    def search
        @tag_list = Tag.all               # こっちの投稿一覧表示ページでも全てのタグを表示するために、タグを全取得
        @tag = Tag.find(params[:tag_id])  # クリックしたタグを取得
        @renres = @tag.genres.all           # クリックしたタグに紐付けられた投稿を全て表示
    end

    private
    def genre_params
        params.require(:genre).permit(:song, :singer)
    end

end
