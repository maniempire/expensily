class AddPaidStatusToLoan < ActiveRecord::Migration
  def change
    add_column :loans, :paid_status, :string
  end
end
