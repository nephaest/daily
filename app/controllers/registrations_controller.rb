class RegistrationsController < Devise::RegistrationsController


  def new
    super
  end

  def create
    # add custom create logic here
    super
    # if current_user == "I'm a owner"
    #   redirect_to
    # else
    #   redirect_to
    # end
  end

  def update
    super
  end


  private

  def sign_up_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :photo, :photo_cache, :position)
  end

  def account_update_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :current_password, :photo, :photo_cache, :position)
  end
end
