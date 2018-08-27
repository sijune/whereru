class CommentsController < ApplicationController
  before_action :authenticate_user!
  
  def userList
    @users = User.all.where.not(id: current_user)
  end
  
  def index
  end
  
  def new
    @recipient = User.find(params[:id])
  end
  
  # 쪽지 보내기
  def create
    @comment = Comment.new
    @comment.sender_id = current_user.id
    @comment.recipient_id = params[:recipient].to_i
    @comment.content = params[:content]
    @comment.save
    
    @new_notification = NewNotification.create! user: User.find(@comment.recipient_id),
    content: "#{current_user.username.truncate(15, omission: '...')} 님으로 부터 쪽지가 왔습니다.",
    link: "/comments/show/#{@comment.id}"
                                           
    redirect_to '/comments/index'
    
  end
  
  # 내가 보낸 쪽지함
  def sent
    @comments = Comment.where("sender_id LIKE ?", "#{current_user.id}").order("created_at DESC").page(params[:page]).per(10)
  end
  
  # 내가 받은 쪽지함
  def recieve
    @comments = Comment.where("recipient_id LIKE ?", "#{current_user.id}").order("created_at DESC").page(params[:page]).per(10)
  end
  
  def show
    @comment = Comment.find(params[:id])
  end
end
