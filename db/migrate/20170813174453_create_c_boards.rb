class CreateCBoards < ActiveRecord::Migration[5.0]
  def change
    create_table :c_boards do |t|
      t.integer :area_id
      t.integer :category_id
      t.string :titile
      t.string :img_url
      t.text :content
      t.integer :tel
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
