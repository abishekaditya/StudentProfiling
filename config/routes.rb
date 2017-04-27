Rails.application.routes.draw do
  get 'questions/add'
  get 'questions/submitted'
  post 'questions/submit', to: 'questions#submit'
  post 'questions/submitted', to: 'questions#submitted'

  get 'course/analysis'
  get 'questions/analysis'

  get 'questions/index/:id', to: 'questions#index'

  get 'questions/destroy'

  get 'questions/attempt/:id', to: 'questions#attempt'


  get 'course/index'

  get 'course/join'
  post 'course/join', to: 'course#verify'

  get 'course/create'
  post 'course/create', to: 'course#make'

  get 'course/new/:id', to: 'course#new'

  get 'course/destroy'

  devise_for :teachers
  devise_for :students

  get '/home/student', to: 'home#student'
  get '/home/teacher', to: 'home#teacher'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'home#index'
end
