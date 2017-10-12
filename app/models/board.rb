class Board < ApplicationRecord
  belongs_to :user
  belongs_to :b_area
  belongs_to :b_category
  has_many :comments, dependent: :destroy
  
  
  validates :user_id, presence: true
  validates :title, presence: true, length: { maximum: 100 }
  validates :content, presence: true, length: { maximum: 1000 }
  
  validates_acceptance_of :agreement, allow_nil: false, on: :create

end
