class Answer < ApplicationRecord
  belongs_to :question
  belongs_to :user
  belongs_to :quiz

  validates :response, presence: true
end
