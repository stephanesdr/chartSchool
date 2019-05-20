# frozen_string_literal: true

module ControllerMacros
  def login_student
    before do
      @request.env["devise.mapping"] = Devise.mappings[:student]
      student = FactoryBot.create(:student)
      # student.confirm! dont need this until student has to validates his account
      sign_in student
    end
  end

  def login_teacher
    before do
      @request.env["devise.mapping"] = Devise.mappings[:teacher]
      teacher = FactoryBot.create(:teacher)
      teacher.admin = true
      teacher.save
      # teacher.confirm! dont need this until teacher has to validates his account
      sign_in teacher
    end
  end
end
