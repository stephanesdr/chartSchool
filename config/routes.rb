Rails.application.routes.draw do
  root 'home#index'
  devise_for :students, path: 'students', :controllers => { sessions: "students/sessions",
                                                            registrations: "students/registrations" }
  devise_for :teachers, path: 'teachers', :controllers => { sessions: "teachers/sessions",
                                                            registrations: "teachers/registrations" }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :courses, only: %i[new create show index] do
    resources :steps, only: %i[create] do
      resources :steps_students, only: %i[create destroy]
    end
  end

end
