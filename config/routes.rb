Rails.application.routes.draw do
  devise_for :users
  root to: "rooms#index"#ルートパスをrooms/index.html.erbのビューファイルに設定する
  resources :users, only: [:edit, :update, ]
  resources :rooms, only: [:new, :create, :destroy] do#roomsが親messagesが子になるようにdoチャットルームに属しているメッセージになる
   resources :messages, only: [:index, :create]#メッセージに結びつくルームの情報を含んだパスを受け取れる
  end
end
