class Post < ApplicationRecord


    belongs_to :user

    has_many :photos, dependent: :destroy

    has_many :likes, -> { order(created_at: :desc) }, dependent: :destroy
    #dependent: :destroyをつけることで、オブジェクトが削除されるときに、関連付けられたオブジェクトのdestroyメソッドが実行される
    #投稿が削除されたら、その投稿に紐づくいいねも削除される
    #いいねを取得する時、作られた逆順で取得

    accepts_nested_attributes_for :photos

    def liked_by(user)
        # user_idとpost_idが一致するlikeを検索する
        Like.find_by(user_id: user.id, post_id: id)
      end

end
