class RerepliesController < ApplicationController
  before_action :authenticate_user!
  
  def create
    @rereply=Rereply.new
    @rereply.to_user=params[:to_user]
    @rereply.content=params[:content]
    @rereply.post_jd=params[:post_id]
    @rereply.reply_id=params[:reply_id]
    @rereply.user_id = current_user.id
    @rereply.save
  
    # 게시물 내에 답글이 달릴 시 알림이 울림.
    replyUser = @rereply.reply.user
    @new_notification = NewNotification.create! user: replyUser,
                                                                     content:"#{current_user.username.truncate(15, omission: '...')} 님이 답글을 달았습니다.",
                                                                     link: request.referrer
    redirect_to :back
  end

  def destroy
    @reply=Rereply.find(params[:id])
    
    if current_user == @reply.user
      @reply.destroy
      redirect_to :back
    else
      redirect_to :back
    end
    
  end
end
