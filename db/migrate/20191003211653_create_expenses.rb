class CreateExpenses < ActiveRecord::Migration[5.2]
  def change
    create_table :expenses do |t|
      t.string :uuid
      t.string :description
      t.integer :amount
      t.string :currency
      t.datetime :created_at
      t.references :employee, foreign_key: true

      t.timestamps
    end
  end
end
