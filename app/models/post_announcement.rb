class PostAnnouncement < ApplicationRecord
    validates :title, presence: true
    validates :content, presence: true
    validates :post, presence: true

  
  scope :willpost, -> { where('post <= ?', DateTime.now) }

end
