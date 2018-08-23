class CreateNeedcomments < ActiveRecord::Migration
  def change
    create_table :needcomments do |t|
      t.references :user, index: true, foreign_key: true
      t.references :need, index: true, foreign_key: true
      t.text :content
      t.string :name
      t.timestamps null: false
    end
  end
end
