class CBoard < ApplicationRecord
  belongs_to :user
  
  validates :user_id, presence: true
  validates :area_id, presence: true
  validates :category_id, presence: true
  validates :title, presence: true, length: { maximum: 255 }
  validates :img_url, presence: true, length: { maximum: 255 }
  validates :content, presence: true, length: { maximum: 255 }
  validates :tel, presence: true, length: { maximum: 11 }
  
  
end
