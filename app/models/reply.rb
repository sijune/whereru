class Reply < ActiveRecord::Base
    belongs_to :post
    belongs_to :user
    has_many :rereplies
    has_many :relikes
    has_many :rehates
    has_many :reliked_users, through: :relikes, source: :user
    has_many :rehated_users, through: :rehates, source: :user
end
