class Post < ApplicationRecord
  validates :content, presence: true, length: { maximum: 140 }
  validates :user_id, presence: true
  belongs_to :user
  belongs_to :gym, optional: true
  default_scope -> { order(created_at: :desc) }
end
