class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  include Pundit

  rescue_from Pundit::NotAuthorizedError, with: :forbidden

  private

  def forbidden
    flash[:alert] = 'You are not authorized to perform this action.'
    redirect_to request.referrer || root_path
  end
end
