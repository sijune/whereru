class RerelikesController < ApplicationController
    def likes_toggle
        rerelike = Rerelike.find_by(user_id: current_user.id, rereply_id: params[:id])
        if rerelike.nil?
            Rerelike.create(user_id: current_user.id, rereply_id: params[:id])
            
            # 인기 답글 선정
            rereply = Rereply.find_by_id(params[:id])
            if (rereply.rerelikes.size - rereply.rerehates.size) >=3 
                rereply.hot =1
                rereply.save
            end
            
        else
            rerelike.destroy
             # 인기 답글 탈락
            rereply = Rereply.find_by_id(params[:id])
            if (rereply.rerelikes.size - rereply.rerehates.size) < 3 
                rereply.hot =0
                rereply.save
            end
        end
        redirect_to :back
    end
end
