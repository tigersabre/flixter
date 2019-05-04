class LessonsController < ApplicationController
  before_action :authenticate_user!
  before_action :require_authorized_for_lesson, only: [:show]

  def show

  end

  private

  def require_authorized_for_lesson
    if current_lesson.user != current_user
      redirect_to root_url, alert: 'You cant view this lesson, please enroll'
    end
  end

  helper_method :current_lesson
  def current_lesson
    @current_lesson ||= Lesson.find(params[:id])
  end
end
