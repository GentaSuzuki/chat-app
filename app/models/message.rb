class Message < ApplicationRecord
  belongs_to :user
  belongs_to :room
  has_one_attached :image#モデルの各レコードは一つの画像ファイルを添付できる

  validates :content, presence: true#contentを指定することで空の投稿の場合DBに保在しない
end
