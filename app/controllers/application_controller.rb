class ApplicationController < ActionController::Base
  add_flash_types :error, :warning, :success

  #protect_from_forgery with: :exception

  private
  def authorize_user!
    unless current_user.instance_of? Master
      redirect_to root_path, warning: "접근을 하려면 권한이 필요합니다."
    end
  end

  def authenticate_user!
    unless user_signed_in?
      redirect_to new_user_session_path, warning: "로그인이 필요합니다."
      # else
      #   if current_user.status == ready
      #
      #   end
    end
  end
end
