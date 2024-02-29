Rails.application.routes.draw do

  resources :users, only => [:create, :delete]
  put 'users/update-username', to: 'users#update_username'
  put 'users/update-password', to: 'users#update_password'

end
