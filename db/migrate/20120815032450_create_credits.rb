class CreateCredits < ActiveRecord::Migration
  def self.up
    create_table :credits do |t|
      t.string :given_to
      t.date :date
      t.float :amount
      t.string :details
      t.timestamps
    end
  end

  def self.down
    drop_table :credits
  end
end
