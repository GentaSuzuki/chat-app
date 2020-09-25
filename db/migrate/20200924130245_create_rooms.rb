class CreateRooms < ActiveRecord::Migration[6.0]
  def change
    create_table :rooms do |t|
      t.string :name, null: false#null: falseは指定したからむに空状態で保存させることを防ぐ
      t.timestamps
    end
  end
end
