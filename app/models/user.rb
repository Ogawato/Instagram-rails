class User < ApplicationRecord

  has_many :posts, dependent: :destroy
  #他のモデルとの間に「1対多」のつながりがあることを示す
  #オブジェクトが削除されるときに、関連付けられたオブジェクトのdestroyメソッドが実行

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


  validates :name, presence: true, length: { maximum: 50 }

  def update_without_current_password(params, *options)

    if params[:password].blank? && params[:password_confirmation].blank?
      params.delete(:password)
      params.delete(:password_confirmation)
    end

    result = update_attributes(params, *options)
    clean_up_passwords
    result
  end

end
