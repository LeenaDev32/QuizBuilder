class Question < ApplicationRecord
  belongs_to :quiz
  has_many :answers

  validates :title, presence: true, uniqueness: true
end
