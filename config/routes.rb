Rails.application.routes.draw do
  devise_for :users
  root to: "rooms#index"#ルートパスをrooms/index.html.erbのビューファイルに設定する
  resources :users, only: [:edit, :update, ]
  resources :rooms, only: [:new, :create]
end
