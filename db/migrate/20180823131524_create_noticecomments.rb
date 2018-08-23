class CreateNoticecomments < ActiveRecord::Migration
  def change
    create_table :noticecomments do |t|
      
      t.references :user, index: true, foreign_key: true
      t.references :notice, index: true, foreign_key: true
       
       t.string :content
       t.string :name
      t.timestamps null: false
    end
  end
end
