class Message < ApplicationRecord
  belongs_to :user
  belongs_to :room
  has_one_attached :image#モデルの各レコードは一つの画像ファイルを添付できる

  validates :content, presence: true, unless: :was_attached?#contentを指定することで空の投稿の場合DBに保存しないもしくは、付随して

  def was_attached?
    self.image.attached?#テキストが存在しなくても画像を送信できるようになる
  end
end
