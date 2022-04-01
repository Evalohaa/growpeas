class Category < ApplicationRecord
  has_many :activities
  has_many :courses, through: :activities
end
