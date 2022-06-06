class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  def after_sign_in_path_for(_resource)
    quizzes_path
  end

  def authenticate_admin!
    redirect_to root_path, notice: 'Your are not authorize to perform this action' unless current_user.admin?
  end
end
