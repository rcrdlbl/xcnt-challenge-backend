class CreateEmployees < ActiveRecord::Migration[5.2]
  def change
    create_table :employees do |t|
      t.string :uuid
      t.string :last_name
      t.string :first_name

      t.timestamps
    end
  end
end
