class User::RegistrationsController < Devise::RegistrationsController
# before_action :configure_sign_up_params, only: [:create]
# before_action :configure_account_update_params, only: [:update]

  # GET /resource/sign_up
  # def new
  #   super
  # end

  # POST /resource
  def create
    new_user_params = sign_up_params
    user = User.where({name: new_user_params[:name], school_id: new_user_params[:school_id]}).all

    return redirect_to root_path, error: "등록되지 않은 운영진입니다. 중앙운영진에 등록을 요청한 후 다시 시도하세요" if user.size == 0

    return redirect_back fallback_location: new_user_registration_path, error: "이미 등록되어 있는 이메일 입니다." if User.find_by_email(new_user_params[:email])

    return redirect_to root_path, error: "이미 등록된 사용자 입니다." if user.size == 1 && user[0].email?

    user.each do |u|
      if u.email.nil?
        u.update(new_user_params)
        u.update(status: "join")
        sign_up(resource_name, u)
        return respond_with u, location: after_sign_up_path_for(u)
      end
    end
    redirect_to root_path, error: "이미 등록된 사용자 입니다."
  end

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  # protected
  protected
  def sign_up_params
    params.require(:user).permit(:email, :password, :password_confirmation, :name, :school_id)
  end

  def account_update_params
    params.require(:user).permit(:email, :password, :password_confirmation, :current_password, :name, :school_id)
  end
  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
  # end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end
