class Session < ApplicationRecord
  validates :start_date, presence: true
  validates :end_date, presence: true
  has_and_belongs_to_many :courses
  scope :active, -> { where("? BETWEEN start_date and end_date", Time.now.to_date)}
end
