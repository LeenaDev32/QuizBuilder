class HomeController < ApplicationController
  skip_before_action :authenticate_user!, only: :index
  def index
    redirect_to quizzes_path and return if user_signed_in?
  end
end
