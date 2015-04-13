class Idea < ActiveRecord::Base

  belongs_to :user
  has_many :comments, dependent: :destroy

  has_many :joins, dependent: :destroy
  has_many :joined_users, through: :joins, source: :user

  has_many :likes, dependent: :destroy
  has_many :liked_users, through: :likes, source: :user

  validates :title, length: {minimum: 10}

  def join_for(user)
    joins.find_by_user_id(user.id) if user 
  end

  def like_for(user)
    likes.find_by_user_id(user.id) if user 
  end

end
