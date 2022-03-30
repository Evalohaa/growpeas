class Course < ApplicationRecord
  belongs_to :user
  belongs_to :activity
  has_many :reservations, dependent: :destroy
  has_many :categories, through: :activities
  has_one_attached :photo
  validates :name, presence: true, length: { minimum: 2 }
  validates :activity, presence: true
  validates :duration, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :date, presence: true
  validates :description, presence: true, length: { minimum: 100 }
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 1 }
  validates :address, presence: true
  validates :max_of_attendees, presence: true, numericality: { greater_than_or_equal_to: 1 }
  validates :starting_time, presence: true

end
