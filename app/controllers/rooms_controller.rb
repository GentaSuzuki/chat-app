class RoomsController < ApplicationController

  def new#新規投稿ページを表示するリクエストに対応
    @room =Room.new
  end

  def create#データ投稿を行うリクエストに対応
    @room = Room.new(room_params)
    if @room.save #ルームが保存されたら
      redirect_to root_path #true message#indexすなわちチャットルームにリダイレクトされる
    else
      render :new#false もう一度同じ画面に戻るroom/new.html.erb
    end
  end

  private#クラス外から呼び出せないclassの外部から呼び出されたら困るもの

  def room_params#ストロングパラメーター指定した情報のみを受け取る仕組み
    params.require(:room).permit(:name,user_ids:[])#params(リクエストに含まれ、外部から送られてきたデータを格納するもの)外からrequireがあった(:room)を内からpermitで取得したいキーと値をセットで出す
  end
end
