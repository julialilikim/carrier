Rails.application.routes.draw do
  devise_for :users
  root 'homes#index'
  
  get 'homes/index'
  get 'homes/aboutus'
  get 'homes/rule'
  get 'homes/mypage'
  

  post 'needs/check'
  post 'gives/check'
  
  #like
  post '/:t_id/like_create' => 'likes#like_create'
  
  resources :notices do
    post 'comments', to: 'notices#comment'
    get 'comments/:id', to: 'noticess#comment_edit', as: :comment_edit
    patch 'comments/:id', to: 'notices#comment_update', as: :comment_update
    delete 'comments/:id', to: 'notices#comment_destroy', as: :comment_destroy
  end
  
  
  resources :gives do
    post 'comments', to: 'gives#comment'
    get 'comments/:id', to: 'gives#comment_edit', as: :comment_edit
    patch 'comments/:id', to: 'gives#comment_update', as: :comment_update
    delete 'comments/:id', to: 'gives#comment_destroy', as: :comment_destroy
  end
  
  resources :needs do
    post 'comments', to: 'needs#comment'
    get 'comments/:id', to: 'needs#comment_edit', as: :comment_edit
    patch 'comments/:id', to: 'needs#comment_update', as: :comment_update
    delete 'comments/:id', to: 'needs#comment_destroy', as: :comment_destroy
  end
  
  resources :sells do
    post 'comments', to: 'sells#comment'
    get 'comments/:id', to: 'sells#comment_edit', as: :comment_edit
    patch 'comments/:id', to: 'sells#comment_update', as: :comment_update
    delete 'comments/:id', to: 'sells#comment_destroy', as: :comment_destroy
  end
  
  resources :tips do
    post 'comments', to: 'tips#comment'
    get 'comments/:id', to: 'tips#comment_edit', as: :comment_edit
    patch 'comments/:id', to: 'tips#comment_update', as: :comment_update
    delete 'comments/:id', to: 'tips#comment_destroy', as: :comment_destroy
  end
  
  
 
end
