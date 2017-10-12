class CreateBCategories < ActiveRecord::Migration[5.0]
  def change
    create_table :b_categories do |t|
      t.string :name
      t.string :ancestry
      t.timestamps
    end
  end
end
