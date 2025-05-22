class SettingsController < ApplicationController
  before_action :authenticate_account!

  def index
    @user = current_account
  end

  def update_profile
    if current_account.update(account_params)
      redirect_to settings_path, notice: "Profile updated successfully."
    else
      redirect_to settings_path, alert: current_account.errors.full_messages.to_sentence
    end
  end

  def update_password
    if current_account.valid_password?(params[:user][:current_password])
      if current_account.update(password_params)
        bypass_sign_in(current_account)  # Required to keep user signed in
        redirect_to settings_path, notice: "Password updated successfully."
      else
        redirect_to settings_path, alert: current_account.errors.full_messages.to_sentence
      end
    else
      redirect_to settings_path, alert: "Current password is incorrect."
    end
  end

  def update_preferences
    # Assume preferences are stored in the Account model in `:dark_mode` and `:currency`
    if current_account.update(preferences_params)
      redirect_to settings_path, notice: "Preferences saved successfully."
    else
      redirect_to settings_path, alert: current_account.errors.full_messages.to_sentence
    end
  end

  def destroy_account
    current_account.destroy
    redirect_to root_path, notice: "Account deleted successfully."
  end

  private

  def account_params
    params.require(:user).permit(:name, :email)
  end

  def password_params
    params.require(:user).permit(:password, :password_confirmation)
  end

  def preferences_params
    params.require(:preferences).permit(:dark_mode, :currency)
  end
end
