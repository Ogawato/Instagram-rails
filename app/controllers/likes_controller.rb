class LikesController < ApplicationController

    before_action :authenticate_user!
    #ユーザーがサインインしていない状態でいいねをしても、誰がいいねしたか分からない
    #authenticate_user!を使ってサインイン済みユーザーのみにアクセス許可を与える


    def create
      @like = current_user.likes.build(like_params) #buildメソッドを使って、インスタンスを作成
      @post = @like.post #@likeにはpost_idとuser_idが入る.like.postというコードで@likeに紐づく投稿の情報を持ってくる    
      if @like.save
        respond_to :js
      end
    end

    def destroy
        @like = Like.find_by(id: params[:id])
        @post = @like.post
        if @like.destroy
          respond_to :js
        end
    end
  
    private
      def like_params
        params.permit(:post_id)
      end
      #paramsとは送られてきたリクエスト情報をひとまとめにしたもの
      #permitで変更を加えられるキーを指定する。今回の場合、post_idキーを指定
      #いいねを押したときに、どの投稿にいいねを押したのかpost_idの情報を変更できるように指定

  end
  