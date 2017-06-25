class Course < ApplicationRecord
  validates :title, presence: true, length: { maximum: 250 }
  validates :content, presence: true, length: { minimum: 100 }
end
