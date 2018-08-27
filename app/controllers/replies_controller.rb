class RepliesController < ApplicationController
  before_action :authenticate_user!
  
  def create
    @reply=Reply.new
    @reply.content=params[:content]
    @reply.post_id=params[:post_id]
    @reply.user=current_user
    @reply.save
    
    # 게시물 내에 댓글이 달릴 시 알림이 울림.
    postUser = @reply.post.user
    @new_notification = NewNotification.create! user: postUser,
                                                    content: "#{current_user.username.truncate(15, omission: '...')} 님이 댓글을 달았습니다.",
                                                    link: request.referrer
    
    redirect_to :back
    
  end


  def destroy
    @reply=Reply.find(params[:id])
    
    if current_user == @reply.user
      
      # 댓글에 소속된 답글 삭제
      Rereply.where("reply_id LIKE ?", "#{@reply.id}").each do |rere|
        rere.destroy
      end
      @reply.destroy
      redirect_to :back

    else
      redirect_to :back
    end
  end
  
end
