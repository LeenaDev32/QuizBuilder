class Question < ApplicationRecord
  INPUT_TYPES = %w[text textarea number]

  belongs_to :quiz
  has_many :answers, dependent: :destroy

  validates :title, presence: true, uniqueness: true
  validates :question_type, presence: true, inclusion: { in: INPUT_TYPES }
end

