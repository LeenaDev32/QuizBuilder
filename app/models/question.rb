class Question < ApplicationRecord
  belongs_to :quiz

  validates :title, presence: true, uniqueness: true
end
