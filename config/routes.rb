Rails.application.routes.draw do
  get 'messages/index'
  root to: "messages#index" #ルートパスへのアクセスがあったらメッセージコントローラーのindexアクションで一覧ページが表示される
end
