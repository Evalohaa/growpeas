class Course < ApplicationRecord
  belongs_to :user
  belongs_to :activity
  has_many :reservations, dependent: :destroy
  has_many :categories, through: :activities
end
