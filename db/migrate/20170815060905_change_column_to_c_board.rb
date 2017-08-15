class ChangeColumnToCBoard < ActiveRecord::Migration[5.0]
  def change
    rename_column :c_boards, :titile, :title
  end
end
