Rails.application.routes.draw do
  get 'competencies/list'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :competencies
end
