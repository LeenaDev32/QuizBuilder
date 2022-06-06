class AnswersController < ApplicationController
  before_action :quiz

  def new; end

  def create
    create_answers
    redirect_to quizzes_path, notice: 'Quiz submitted successfully, Thank You!!'
  end

  private

  def quiz
    @quiz ||= Quiz.find_by_id(params[:quiz_id])
  end

  def create_answers
    quiz.questions.each do |que|
      answer = que.answers.new do |a|
        a.response = params["#{que.id}"]
        a.user_id = current_user.id
        a.quiz_id = params[:quiz_id]
      end
      answer.save!
    end
  end
end
