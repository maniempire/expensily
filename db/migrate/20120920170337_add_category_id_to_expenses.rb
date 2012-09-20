class AddCategoryIdToExpenses < ActiveRecord::Migration
  def change
    add_column :expenses, :category_id, :int
  end
end
