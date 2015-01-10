class RegistrationsController < Devise::RegistrationsController
  protected


  private

  def sign_up_params
    params.require(:user).permit(
    :profile_photo,
    :sname,
    :email,
    :password,
    :password_confirmation
    )
  end

  def account_update_params
    params.require(:user).permit(
    :profile_photo,
    :sname,
    :email,
    :password,
    :password_confirmation
    )
  end
end
