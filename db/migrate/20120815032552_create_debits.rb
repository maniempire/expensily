class CreateDebits < ActiveRecord::Migration
  def self.up
    create_table :debits do |t|
      t.string :get_from
      t.date :date
      t.float :amount
      t.string :details
      t.timestamps
    end
  end

  def self.down
    drop_table :debits
  end
end
