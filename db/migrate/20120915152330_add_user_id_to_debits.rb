class AddUserIdToDebits < ActiveRecord::Migration
  def change
    add_column :debits, :user_id, :int
  end
end
