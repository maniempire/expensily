class RemoveTypeFromCategories < ActiveRecord::Migration
  def up
    remove_column :categories, :type
      end

  def down
    add_column :categories, :type, :string
  end
end
