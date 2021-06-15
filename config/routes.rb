Rails.application.routes.draw do
  devise_for :users, 
    controllers: { registrations: 'registrations' }

  root 'pages#home'

  get '/users/:id', to: 'users#show', as: 'user'


  get '/posts/new', to: 'posts#new'
  post '/posts', to: 'posts#create'
  post '/posts/:post_id/photos', to: 'photos#create', as: 'post_photos'

  resources :posts, only: %i(new create) do
    resources :photos, only: %i(create)
  end
  #ネスト（入れ子）にすることで、親子関係をルーティングで表す
  #photosに関してはpostsに対して「子」の関係になるので、ネストすることで、どの投稿に紐づくかを明示できる
  #

end
