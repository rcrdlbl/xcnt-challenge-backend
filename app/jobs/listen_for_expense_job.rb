class ListenForExpenseJob < ApplicationJob
  require 'http'
  queue_as :default

  def perform(*args)
    # Do something later
    puts "Expense Listener Started!"

    response = HTTP.get("https://cashcog.xcnt.io/stream")
    response.body.each do |piece|
      puts piece.to_s
    end
  end
end
