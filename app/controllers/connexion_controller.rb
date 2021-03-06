# frozen_string_literal: true

class ConnexionController < ApplicationController
  include RegistrationsHelper
  layout "connexion"

  protected

  def after_sign_in_path_for(_resource)
    home_index_path
  end

  def after_sign_out_path_for(_resource)
    root_path
  end
end
