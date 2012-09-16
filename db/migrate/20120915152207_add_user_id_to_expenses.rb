class AddUserIdToExpenses < ActiveRecord::Migration
  def change
    add_column :expenses, :user_id, :int
  end
end
