class CreateTipcomments < ActiveRecord::Migration
  def change
    create_table :tipcomments do |t|
      t.references :user, index: true, foreign_key: true
      t.references :tip, index: true, foreign_key: true
      t.text :content
      t.string :name
      t.timestamps null: false
    end
  end
end
