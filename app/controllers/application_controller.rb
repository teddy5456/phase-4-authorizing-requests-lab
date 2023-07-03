# app/controllers/application_controller.rb

class ApplicationController < ActionController::Base
  def authenticate_user!
    render json: { error: 'Unauthorized' }, status: 401 unless user_signed_in?
  end

  def user_signed_in?
    current_user.present?
  end
end
