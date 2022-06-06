class Question < ApplicationRecord
  INPUT_TYPES = %w[text textarea number checkbox ]

  belongs_to :quiz
  has_many :answers

  validates :title, presence: true, uniqueness: true
  validates :question_type, presence: true, inclusion: { in: INPUT_TYPES }
end

