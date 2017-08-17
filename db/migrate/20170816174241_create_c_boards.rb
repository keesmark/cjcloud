class CreateCBoards < ActiveRecord::Migration[5.0]
  def change
    create_table :c_boards do |t|
      t.references :user, foreign_key: true
      t.references :area, foreign_key: true
      t.references :category, foreign_key: true
      t.string :title
      t.text :content
      t.string :img_url
      t.string :tel

      t.timestamps
    end
  end
end
