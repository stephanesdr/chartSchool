# frozen_string_literal: true

class ApplicationMailer < ActionMailer::Base
  default from: 'no-reply@chartschool.fr'
  layout 'mailer'
end
