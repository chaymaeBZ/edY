class Course < ApplicationRecord
  has_and_belongs_to_many :sessions
  validates :title, presence: true, length: { maximum: 250 }
  validates :content, presence: true, length: { minimum: 100 }
end
