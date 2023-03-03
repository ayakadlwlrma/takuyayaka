class LovesController < ApplicationController
    def create
        love = current_user.loves.create(point_id: params[:point_id]) #user_idとtweet_idの二つを代入
        redirect_back(fallback_location: root_path)
      end
    
      def destroy
        love = Love.find_by(point_id: params[:point_id], user_id: current_user.id)
        love.destroy
        redirect_back(fallback_location: root_path)
      end
end
