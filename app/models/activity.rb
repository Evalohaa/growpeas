class Activity < ApplicationRecord
  belongs_to :category
  has_many :courses
end
