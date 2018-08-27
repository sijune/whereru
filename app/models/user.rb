class User < ActiveRecord::Base
  has_one :profile, dependent: :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         
         has_many :posts
         has_many :replies
         has_many :rereplies
         has_many :likes
         has_many :hates
         has_many :liked_posts, through: :likes, source: :post
         has_many :hated_posts, through: :hates, source: :post
         has_many :relikes
         has_many :rehates
         has_many :reliked_replies, through: :relikes, source: :reply
         has_many :rehated_replies, through: :rehates, source: :reply
         has_many :rerelikes
         has_many :rerehates
         has_many :rereliked_replies, through: :rerelikes, source: :rereply
         has_many :rerehated_replies, through: :rerehates, source: :rereply
         has_many :new_notifications
         acts_as_reader
         
         
    #게시글 추천 비추천
    def is_like?(post)
        Like.find_by(user_id: self.id, post_id: post.id).present?
    end
    
    def is_hate?(post)
        Hate.find_by(user_id: self.id, post_id: post.id).present? 
    end
    
    #댓글 추천 비추천
    def is_relike?(reply)
        Relike.find_by(user_id: self.id, reply_id: reply.id).present?
    end
    
    def is_rehate?(reply)
        Rehate.find_by(user_id: self.id, reply_id: reply.id).present? 
    end
    
    #답글 추천 비추천
    def is_rerelike?(rereply)
        Rerelike.find_by(user_id: self.id, rereply_id: rereply.id).present?
    end
    
    def is_rerehate?(rereply)
        Rerehate.find_by(user_id: self.id, rereply_id: rereply.id).present? 
    end
end
