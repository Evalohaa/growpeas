class Course < ApplicationRecord
  belongs_to :user
  belongs_to :activity
  has_many :reservations, dependent: :destroy
end
