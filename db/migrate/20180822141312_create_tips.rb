class CreateTips < ActiveRecord::Migration
  def change
    create_table :tips do |t|
      t.references :user, index: true, foreign_key: true
      t.text :content
      t.string :title
      t.string :image_url, :default => ""
      t.string :name
      t.timestamps null: false
    end
  end
end
