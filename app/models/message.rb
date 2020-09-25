class Message < ApplicationRecord
  belongs_to :user
  belongs_to :room

  validates :content, presence: true#contentを指定することで空の投稿の場合DBに保在しない
end
