class Rereply < ActiveRecord::Base
    belongs_to :reply
    belongs_to :user
    has_many :rerelikes
    has_many :rerehates
    has_many :rereliked_users, through: :rerelikes, source: :user
    has_many :rerehated_users, through: :rerehates, source: :user
end
