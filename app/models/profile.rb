class Profile < ActiveRecord::Base
  belongs_to :user
  validates :name, presence: true, length: { minimum: 1, maximum: 30 }
  validates :mobile, presence: true
end
