class MessagesController < ApplicationController
  def index#一覧表示する
    @message = Message.new#Message.newで生成したモデルのインスタンス情報代入
    @room = Room.find(params[:room_id])#params(リクエストに含まれる)に含まれるroom_idを代入ルーティングをネストしているため
    @messages = @room.messages.includes(:user)#チャットルームに紐づいている全てのメッセージが入っている@room.messagesを@messagesに代入includes(N＋１問題で解消)でユーザー情報を一度のアクセスでまとめて処理することができる
  end

  def create#データ投稿を行う
    @room = Room.find(params[:room_id])#@roomの変数生成とどの部屋にデータ投稿を行うか
    @message = @room.messages.new(message_params)#@roomの内容＋チャットルームに紐づいたメッセージのインスタンス生成＋引数でprivateメソッド呼び出し
      if  @message.save#データを保存するmessagesテーブルに
        redirect_to room_messages_path(@room)#true 参加しているチャットルームに投稿したメッセージの一覧画面へ
      else
        @messages = @room.messages.includes(:user)#投稿に失敗した内容も保持しつつ
        render :index# false indexが実行同じページへ戻る
      end
  end


  private

  def message_params
    params.require(:message).permit(:content).merge(user_id: current_user.id)#messageの内容をmessagesテーブルに保存できるようにメッセージのリクエストがあったときにcontentのカラム名にuser_id,currentuser_idと紐づける
  end
end

