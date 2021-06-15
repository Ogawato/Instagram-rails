class Like < ApplicationRecord

    belongs_to :user
    belongs_to :post

    validates :user_id, uniqueness: { scope: :post_id }
    #user_idとpost_idの組み合わせが重複していないことを検証
end
