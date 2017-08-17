class CBoard < ApplicationRecord
  belongs_to :user
  belongs_to :area
  belongs_to :category
  
  validates :user_id, presence: true
  validates :area_id, presence: true
  validates :category_id, presence: true
  validates :title, presence: true, length: { maximum: 255 }
  validates :img_url, length: { maximum: 255 }
  validates :content, presence: true, length: { maximum: 1000 }
  validates :tel, length: { maximum: 20 }
  
end
