class CreateExpenses < ActiveRecord::Migration[5.2]
  def change
    create_table :expenses, id: :uuid do |t|
      t.string :description
      t.integer :amount
      t.string :currency
      t.datetime :created_at
      t.boolean :approved
      t.references :employee, type: :uuid
    end
  end
end
