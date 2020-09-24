Rails.application.routes.draw do
  devise_for :users
  get 'messages/index'
  root to: "messages#index" #ルートパスへのアクセスがあったらメッセージコントローラーのindexアクションで一覧ページが表示される
end
