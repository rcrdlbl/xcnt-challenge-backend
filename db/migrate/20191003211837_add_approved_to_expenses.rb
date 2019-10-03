class AddApprovedToExpenses < ActiveRecord::Migration[5.2]
  def change
    add_column :expenses, :approved, :boolean
  end
end
