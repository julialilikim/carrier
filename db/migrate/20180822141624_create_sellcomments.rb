class CreateSellcomments < ActiveRecord::Migration
  def change
    create_table :sellcomments do |t|
      t.references :user, index: true, foreign_key: true
      t.references :sell, index: true, foreign_key: true
      t.text :content
      t.string :name
      t.timestamps null: false
    end
  end
end
