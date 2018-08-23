class CreateNeeds < ActiveRecord::Migration
  def change
    create_table :needs do |t|
      t.references :user, index: true, foreign_key: true
      t.text :content
      t.string :title
      t.string :image_url, :default => ""
      t.string :name
      t.string :s3_file
      t.integer :check, :default => 0
      t.timestamps null: false
      
    end
  end
end
