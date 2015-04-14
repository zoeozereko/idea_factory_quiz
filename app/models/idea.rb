class Idea < ActiveRecord::Base

  belongs_to :user
  has_many :comments, dependent: :destroy

  has_many :joins, dependent: :destroy
  has_many :joined_users, through: :joins, source: :user

  has_many :likes, dependent: :destroy
  has_many :liked_users, through: :likes, source: :user

  validates :title, length: {minimum: 10}

  has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => ""
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

  def join_for(user)
    joins.find_by_user_id(user.id) if user 
  end

  def like_for(user)
    likes.find_by_user_id(user.id) if user 
  end

end
