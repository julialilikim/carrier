class CreateLikes < ActiveRecord::Migration
  def change
    create_table :likes do |t|
      t.integer :likeCount
      t.belongs_to :tip
      t.timestamps null: false
    end
  end
end
