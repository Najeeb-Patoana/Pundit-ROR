class ApplicationController < ActionController::Base
  include Pundit::Authorization

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  after_action :verify_authorized, except: :index
  after_action :verify_policy_scoped, only: :index

  private

  def user_not_authorized
    redirect_to posts_path,
                alert: "You are not authorized to perform this action."
  end
end
