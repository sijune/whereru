class LikesController < ApplicationController
    def likes_toggle
        like = Like.find_by(user_id: current_user.id, post_id: params[:id])
        if like.nil?
            Like.create(user_id: current_user.id, post_id: params[:id])
        else
            like.destroy
        end
        
        post = Post.find(params[:id])
        if (post.likes.size - post.hates.size) >= 3 && (HotPost.where("post_id LIKE ?", "#{post.id}") == [])
            HotPost.create(post_id:(params[:id]))
        end
    
        redirect_to :back
    end
end
