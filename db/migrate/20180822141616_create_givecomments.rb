class CreateGivecomments < ActiveRecord::Migration
  def change
    create_table :givecomments do |t|
      t.references :user, index: true, foreign_key: true
      t.references :give, index: true, foreign_key: true
      t.text :content
      t.string :name
      t.timestamps null: false
    end
  end
end
