class ListenForExpenseJob < ApplicationJob
  require 'http'
  queue_as :default

  def perform(*args)
    # Do something later
    puts "Expense Listener Started!"

    response = HTTP.get("https://cashcog.xcnt.io/stream")
    response.body.each do |piece|
      parsed = piece && piece.length >= 2 ? JSON.parse(piece) : nil
      if parsed
        expense = Expense.find_or_create_by(id: parsed["uuid"]) do |exp|
          exp.description = parsed["description"]
          exp.created_at = parsed["created_at"]
          exp.amount = parsed["amount"]
          exp.currency = parsed["currency"]
        end
        expense.employee = Employee.find_or_create_by(id: parsed["employee"]["uuid"]) do |employee|
          employee.first_name = parsed["employee"]["first_name"]
          employee.last_name = parsed["employee"]["last_name"]
        end
        expense.save
      end
    end
  end
end
