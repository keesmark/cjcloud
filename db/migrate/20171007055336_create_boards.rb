class CreateBoards < ActiveRecord::Migration[5.0]
  def change
    create_table :boards do |t|
      t.references :user, foreign_key: true
      t.references :b_area, foreign_key: true
      t.references :b_category, foreign_key: true
      t.string :title
      t.text :content

      t.timestamps
    end
  end
end
