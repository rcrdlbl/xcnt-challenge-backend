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
        expense = Expense.create(
          uuid: parsed["uuid"],
          description: parsed["description"],
          created_at: parsed["created_at"],
          amount: parsed["amount"],
          currency: parsed["currency"],
        )
        expense.employee = Employee.find_or_create_by(uuid: parsed["employee"]["uuid"]) do |employee|
          employee.first_name = parsed["employee"]["first_name"]
          employee.last_name = parsed["employee"]["last_name"]
        end
      end
    end
  end
end
