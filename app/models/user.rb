class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :name, presence: true
  
  has_many :posts, dependent: :destroy
  has_many :active_relationships, class_name:  "Relationship",
            foreign_key: "follower_id", dependent:   :destroy
  has_many :passive_relationships, class_name:  "Relationship",
            foreign_key: "followed_id", dependent:   :destroy
  has_many :following, through: :active_relationships,  source: :followed
  has_many :followers, through: :passive_relationships, source: :follower

  has_many :messages, dependent: :destroy
  has_many :entries, dependent: :destroy

  has_many :likes, dependent: :destroy
  has_many :liked_posts, through: :likes, source: :post
  
  has_many :replies

  def feed
    Post.where(user_id: active_relationships.select(:followed_id))
    .or(Post.where(user_id: id))
  end

  def follow(other_user)
    following << other_user
  end

  def unfollow(other_user)
    active_relationships.find_by(followed_id: other_user.id).destroy
  end

  def following?(other_user)
    following.include?(other_user)
  end

  def already_liked?(post)
    self.likes.exists?(post_id: post.id)
  end
  
end
