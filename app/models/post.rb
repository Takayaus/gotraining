class Post < ApplicationRecord
  validates :content, presence: true, length: { maximum: 140 }
  validates :user_id, presence: true
  belongs_to :user
  belongs_to :gym, optional: true
  default_scope -> { order(created_at: :desc) }

  has_many :likes
  has_many :liked_users, through: :likes, source: :user
  
  has_many :replies
  attr_accessor :search_gym, :search_title

  def search
    Post.ransack(gym_eq: @search_gym, title_eq: @search_title).result
  end
end
