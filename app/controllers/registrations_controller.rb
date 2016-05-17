class RegistrationsController < Devise::RegistrationsController


  # def new
  #   super
  # end

  # def create
  #   # add custom create logic here
  #   # @user = User.new(sign_up_params)
  #   # @user.save
  #   # if current_user == "I'm a owner"
  #   #   redirect_to
  #   # else
  #   #   redirect_to edit_user_registration_path(@user)
  #   # end
  #   super
  # end

  # def update
  #   super
  # end



  protected

  def after_sign_up_path_for(resource)
    if current_user.position == "I'm a owner"
      new_facility_path(current_user)
    elsif current_user.position == "I'm a job seeker"
      edit_user_registration_path(current_user)
    end
  end

  private

  def sign_up_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :photo, :photo_cache, :position)
  end

  def account_update_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :current_password, :photo, :photo_cache, :position)
  end
end
