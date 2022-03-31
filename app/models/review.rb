class Review < ApplicationRecord
  belongs_to :course

  validates :rating, presence: true
  validates :content, presence: true
end
