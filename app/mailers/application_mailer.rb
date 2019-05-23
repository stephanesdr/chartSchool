# frozen_string_literal: true

class ApplicationMailer < ActionMailer::Base
  default from: 'info.chartschool@gmail.com'
  layout 'mailer'
end
