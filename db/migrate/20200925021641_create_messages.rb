class CreateMessages < ActiveRecord::Migration[6.0]
  def change
    create_table :messages do |t|
      t.string :content #roomsテーブルにstring(文字（短文）)でcommentというカラム名を追加する
      t.references :user,foreign_key: true#foreign_keyは関連する他のテーブルのレコードの主キー(user)を値としてもつ
      t.references :room,foreign_key: true#                                            (room)
      t.timestamps
    end
  end
end
