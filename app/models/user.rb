class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :rememberable, :validatable # , :recoverable

  enum role: %i[user admin].freeze

  validates :email, presence: true, uniqueness: true
  validates :name, :role, presence: true

  has_many :quizzes
  has_many :answers
end
