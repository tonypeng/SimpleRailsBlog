Blog::Application.routes.draw do
  resources :posts
  resources :comments

  root 'posts#index'
end
