require 'nokogiri'
require 'open-uri'

class PostsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :log_impression, :only=> [:show]
 
  #조회수 구현
  def log_impression
    @hit_post = Post.find(params[:id])
    # this assumes you have a current_user method in your authentication system
    @hit_post.impressions.create(ip_address: request.remote_ip,user_id: current_user.id)
  end
   
  # main 화면
  def main
    @post=Post.all
  end
  
  # C 만들기 --------------------------------------------------------
  def new
    @new = 1
    @category = params[:category].to_i #카테고리 인자 넘겨주기(view)
  end

  def create
    uploader = ImageUploader.new
    uploader.store!(params[:image])
    
    @post=Post.new
    @post.category_id = params[:category] #카테고리 분류
    @post.title=params[:input_title]
    @post.content=params[:input_content]
    @post.user= current_user
    @post.image=uploader.url
    
    @post.save
    
    redirect_to "/posts/show/#{@post.id}"
    # if @post.category_id==13
    #   redirect_to "/posts/13/index_pic"
    # elsif @post.category_id==14
    #   redirect_to "/posts/14/index_pic"
    # else
    #   redirect_to "/posts/#{params[:category]}/index"
    # end
  end
  
  # R 보여주기 --------------------------------------------------------  
  def index
    @new = 0
    @category = params[:category].to_i #카테고리 인자 넘겨주기(view)
    @page = params[:page].to_i # 페이지 인자 수 넘겨주기 (숫자 count용)
    
    if @category ==0 # 내가 쓴글
      @posts = current_user.posts.order("created_at DESC").page(params[:page]).per(10)
    else 
      @posts=Post.where("category_id like ?", "#{params[:category]}").order("created_at DESC").page(params[:page]).per(10)
    end
    
  end
  
  def index_pic
    @new = 0
    @posts=Post.where("category_id like ?", "#{params[:category]}").order("created_at DESC").page(params[:page]).per(12)
    @category = params[:category].to_i #카테고리 인자 넘겨주기(view)
    @page = params[:page].to_i # 페이지 인자 수 넘겨주기 (숫자 count용)

  
  end

  def show
    @new = 0
    @post=Post.find(params[:id])
    
    if (@post.likes.size - @post.hates.size) >=3
      @post.hot = 1
    end
    
    @category = @post.category_id #카테고리 인자 넘겨주기(view)
  end

  # U 수정하기 --------------------------------------------------------
  def edit
    @new = 1
    @post=Post.find(params[:id])
    
    if current_user == @post.user
      @category = @post.category_id
    
    else
      redirect_to :back
    
    end
  end
  
  def update
    uploader = ImageUploader.new
    uploader.store!(params[:image])
    
    @post=Post.find(params[:id])
    @post.title=params[:input_title]
    @post.content=params[:input_content]
    @post.image=uploader.url
    category = @post.category_id
    @post.save
    
    
    if @post.category_id==13
      redirect_to "/posts/13/index_pic"
    elsif @post.category_id==14
      redirect_to "/posts/14/index_pic"
    else
      redirect_to "/posts/#{category}/index"
    end
  end
  
  # D 삭제하기 --------------------------------------------------------  
  def destroy
    
    @post=Post.find(params[:id])
    category=@post.category_id #해당 index로 돌아가기 위한 변수 저장
    
    if current_user == @post.user
      @post.destroy
      
      if (category != 13) && (category != 14)
        redirect_to "/posts/#{category}/index"
      else
        redirect_to "/posts/#{category}/index_pic"
      end
      # 글에 소속 된 댓글 삭제
      Reply.where("post_id LIKE ?", "#{@post.id}").each do |r|
        r.destroy
      end
      
      # 인기게시글 삭제
      hotPost = HotPost.find_by(post_id:(@post.id))
      if  hotPost!= nil
        hotPost.destroy
      end
      
      
      
    else
      redirect_to :back
    end
  end
  
  # search 검색 --------------------------------------------------------  
  def search
    @new = 1
    @page = params[:page].to_i # 페이지 인자 수 넘겨주기 (숫자 count용)
    
    # 작성자 검색을 제외하고 검색어 모델 체크하기
    # if params[:cate]!="4"
      # 문자열 tokenize (두 단어 이상 조합된 띄어쓰기포함 단어들 분할)
      params[:q].split(" ").each do |str|
      
        # 해당 키워드가 있을경우
        keyword = Keyword.find_by_content(str)
        if keyword != nil
          keyword.value += 1 # 1 더하기
          keyword.save
          
        # 없을 경우 만들어주기
        else
          Keyword.create(content: str, value: 1)
        
        end # if
      end # str
    # end # if
    
    
    #total 변수는 총 개수 count 용
    # if params[:cate]=="1"
    #   @post=Post.where("title LIKE ?","%#{params[:q]}%").order("created_at DESC").page(params[:page]).per(10)
    #   @total=Post.where("title LIKE ?","%#{params[:q]}%").count
    # elsif params[:cate]=="2"
    #   @post=Post.where("content LIKE ?","%#{params[:q]}%").order("created_at DESC").page(params[:page]).per(10)
    #   @total=Post.where("content LIKE ?","%#{params[:q]}%").count
    # elsif params[:cate]=="3"
      @posts=Post.where("title Like ? OR content LIKE ?","%#{params[:q]}%", "%#{params[:q]}%").order("created_at DESC").page(params[:page]).per(10)
      @total=Post.where("title Like ? OR content LIKE ?","%#{params[:q]}%", "%#{params[:q]}%").count
      @search = params[:q]
      @category = 99
    # elsif params[:cate]=="4"
    #   @post=User.where("username LIKE ?","%#{params[:q]}%").take.posts.order("created_at DESC").page(params[:page]).per(10)
    #   @total=User.where("username LIKE ?","%#{params[:q]}%").take.posts.count
    # end
  end
  
  
  # 나의 댓글
  def myReply
    @page = params[:page].to_i # 페이지 인자 수 넘겨주기 (숫자 count용)
    @new = 1
    @reply2 = current_user.replies.order("created_at DESC") + current_user.rereplies.order("created_at DESC")
    @reply =  Kaminari.paginate_array(@reply2).page(params[:page]).per(10)
    @total = current_user.replies.count
    @category = 01
  end
  
  # 실시간 인기 게시글
  def hotPost 
    @new = 1
    @hotPostsArr = Array.new
    @page = params[:page].to_i # 페이지 인자 수 넘겨주기 (숫자 count용)
    @category = 02
    
    HotPost.all.reverse.each do |h|
      p = Post.find(h.post_id)
      @hotPostsArr.push(p)
    end
    
    @posts = Kaminari.paginate_array(@hotPostsArr).page(params[:page]).per(10)
    # Post.all.each do |p|
    #   if (p.likes.size - p.hates.size) >= 3
    #   end
    # end
  end
end
