class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      
      t.string :caption
      t.references :user, foreign_key: true, null: false
      #references型は参照先テーブル名の単数形+"_id"がカラム名として設定される
      #今回postsテーブルにはuser_idというカラムが追加される
      
      t.timestamps
    end
  end
end
