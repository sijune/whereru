class RerehatesController < ApplicationController
    def hates_toggle
        rerehate = Rerehate.find_by(user_id: current_user.id, rereply_id: params[:id])
        if rerehate.nil?
            Rerehate.create(user_id: current_user.id, rereply_id: params[:id])
             
             # 인기 답글 탈락
            rereply = Rereply.find_by_id(params[:id])
            if (rereply.rerelikes.size - rereply.rerehates.size) < 3 
                rereply.hot =0
                rereply.save
            end
        else
            
            rerehate.destroy
            # 인기 답글 선정
            rereply = Rereply.find_by_id(params[:id])
            if (rereply.rerelikes.size - rereply.rerehates.size) >=3 
                rereply.hot =1
                rereply.save
            end
        end
        redirect_to :back
    end
end
