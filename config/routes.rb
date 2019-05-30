Rails.application.routes.draw do

  devise_for :people, :controllers => { registrations: "registrations" }
  
  root to: 'connexion/start#index' 

  namespace :connexion do
    resources :start, only: %i[index]
    get 'start/signup', as: 'signup'
  end

  devise_for :students, path: 'students', :controllers => { sessions: "students/sessions",
                                                            registrations: "students/registrations" }
  devise_for :teachers, path: 'teachers', :controllers => { sessions: "teachers/sessions",
                                                            registrations: "teachers/registrations" }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :home, only: %i[index]

  resources :general_question_votes, only: %i[destroy ]
  resources :general_questions, only: %i[new create index update show destroy] do
    resources :general_question_votes, only: %i[create]
  end

  resources :templates do
    resources :template_course, only: %i[create]
    resources :step_templates, only: %i[create destroy]
  end
  resources :courses, only: %i[new create show index] do
    resources :course_template, only: %i[create]
    resources :attendances, only: %i[create]
    resources :steps, only: %i[create] do
      resources :steps_students, only: %i[create destroy]
      resources :steps_people, only: %i[create destroy]
    end


  end

end
