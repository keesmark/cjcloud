class CBoard < ApplicationRecord
  mount_uploader :image, ImageUploader
  mount_uploader :s_image, ImageUploader
  mount_uploader :t_image, ImageUploader
  mount_uploader :f_image, ImageUploader
  
  belongs_to :user
  belongs_to :area
  belongs_to :category
  
  validates :user_id, presence: true
  validates :area_id, presence: true
  validates :category_id, presence: true
  validates :title, presence: true, length: { maximum: 255 }
  validates :image_url, length: { maximum: 255 }
  validates :s_image_url, length: { maximum: 255 }
  validates :t_image_url, length: { maximum: 255 }
  validates :f_image_url, length: { maximum: 255 }
  validates :content, presence: true, length: { maximum: 1000 }
  validates :tel, length: { maximum: 20 }
  
end
