class CreateNotices < ActiveRecord::Migration
  def change
    create_table :notices do |t|
      t.references :user, index: true, foreign_key: true
      t.string :title
      t.text :content
      t.string :image_url, :default => ""
      t.string :name
      t.integer :check, :default => 0

      t.timestamps null: false
    end
  end
end
