class AddUserIdToCredits < ActiveRecord::Migration
  def change
    add_column :credits, :user_id, :int
  end
end
