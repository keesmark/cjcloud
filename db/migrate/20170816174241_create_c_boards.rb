class CreateCBoards < ActiveRecord::Migration[5.0]
  def change
    create_table :c_boards do |t|
      t.references :user, foreign_key: true
      t.references :area, foreign_key: true
      t.references :category, foreign_key: true
      t.string :title
      t.text :content
      t.string :image
      t.string :s_image
      t.string :t_image
      t.string :f_image
      t.string :tel

      t.timestamps
    end
  end
end
