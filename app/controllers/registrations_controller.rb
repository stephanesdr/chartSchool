# frozen_string_literal: true

class RegistrationsController < Devise::RegistrationsController

  private

  def sign_up_params
    params.require(:student).permit(:name)
  end

  def account_update_params
    params.require(:student).permit(:name)
  end

end
