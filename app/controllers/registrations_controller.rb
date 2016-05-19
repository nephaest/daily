class RegistrationsController < Devise::RegistrationsController
  # after_filter :date_format

  # def new
  #   super
  # end

  # def create
  # end

  def update

    @user.min_wage = (account_update_params[:min_wage] * 100)
    @user.birth_date = DateTime.parse(params['user']['birth_date'])
    if @user.update(account_update_params)
      redirect_to worker_path(@user)
    end

  end

  # def date_format
  #   @user.birth_date = DateTime.parse(params['user']['birth_date'])
  # end

  protected

  def after_sign_up_path_for(resource)
    if current_user.position == "I'm a owner"
      new_facility_path(current_user)
    elsif current_user.position == "I'm a job seeker"
      edit_user_registration_path(current_user)
    end
  end

  def after_sign_in_path_for(resource)
    raise
    if current_user.owner?
      facility_path(current_user.facilities)
    elsif current_user.position == "I'm a job seeker"
      raise
      worker_path(current_user.id)
    end
  end

  private

  def sign_up_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :photo, :photo_cache, :position)
  end

  def account_update_params
    params.require(:user).permit(:first_name, :last_name, :photo, :photo_cache, :position, :birth_place, :description, :min_wage, :address, :mobility_radius, :on_duty, :position, :social_security_number, :telephone, :birth_date)
  end
end
