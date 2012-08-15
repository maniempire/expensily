class CreateLoans < ActiveRecord::Migration
  def self.up
    create_table :loans do |t|
      t.string :get_from
      t.date :date
      t.float :amount
      t.string :details
      t.timestamps
    end
  end

  def self.down
    drop_table :loans
  end
end
