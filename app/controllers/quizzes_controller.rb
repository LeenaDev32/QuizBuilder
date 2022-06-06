class QuizzesController < ApplicationController
  before_action :authenticate_admin!, except: :index
  before_action :quiz, only: %i[show edit update destroy]

  def index
    @quizzes = Quiz.all
  end

  def show; end

  def new
    @quiz = Quiz.new
    @questions = @quiz.questions.build
  end

  def create
    @quiz = Quiz.new(quiz_params)
    @quiz.user = current_user
    if @quiz.save
      redirect_to quizzes_path, notice: 'Quiz created successfully!'
    else
      render :new
    end
  end

  def edit
    @questions = @quiz.questions
  end

  def update
    @questions = @quiz.questions
    if @quiz.update(quiz_params)
      redirect_to quizzes_path, notice: 'Quiz updated successfully!'
    else
      render :edit
    end
  end

  def destroy
    @quiz.destroy
    redirect_to quizzes_path, notice: 'Quiz deleted successfully!'
  end

  private

  def quiz
    @quiz ||= Quiz.find_by_id(params[:id])
  end

  def quiz_params
    params.require(:quiz).permit(:name, questions_attributes: %i[title question_type id _destroy])
  end
end
