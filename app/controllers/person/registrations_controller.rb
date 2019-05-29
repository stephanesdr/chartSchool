# frozen_string_literal: true

class Person::RegistrationsController < Devise::RegistrationsController
  private

  def sign_up_params
    params.require(:person).permit(:name, :email, :password, :password_confirmation)
  end

  def account_update_params
    params.require(:person).permit(:name, :email, :password, :password_confirmation)
  end
end
