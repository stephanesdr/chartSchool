# frozen_string_literal: true

class RegistrationsController < Devise::RegistrationsController
  def after_sign_up_path_for(_resource)
    home_index_path
  end

  def create
    build_resource(sign_up_params)

    if resource.save
      yield resource if block_given?
      if resource.active_for_authentication?
        set_flash_message :notice, :signed_up if is_flashing_format?
        sign_up(resource_name, resource)
        respond_with resource, location: after_sign_up_path_for(resource)
      else
        set_flash_message :notice, :"signed_up_but_#{resource.inactive_message}" if is_flashing_format?
        expire_data_after_sign_in!
        respond_with resource, location: after_inactive_sign_up_path_for(resource)
      end
    else
      clean_up_passwords resource
      resource.errors.full_messages.each { |x| flash[x] = x } # Rails 4 simple way
      redirect_to connexion_signup_path
    end
  end

  protected

  def sign_up_params
    params.require(:person).permit(:name, :email, :password, :password_confirmation)
  end

  def account_update_params
    params.require(:person).permit(:name, :email, :password, :password_confirmation)
  end
end
