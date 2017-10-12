class BArea < ApplicationRecord
  has_many :boards
  has_ancestry
end
