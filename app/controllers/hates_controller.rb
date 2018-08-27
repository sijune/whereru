class HatesController < ApplicationController
    def hates_toggle
        hate = Hate.find_by(user_id: current_user.id, post_id: params[:id])
        if hate.nil?
            Hate.create(user_id: current_user.id, post_id: params[:id])
        else
            hate.destroy
        end
        redirect_to :back
    end
end
