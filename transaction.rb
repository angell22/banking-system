class Transaction
  attr_accessor :origin, :transaction_type, :destination, :amount

  def initialize(origin, transaction_type, destination, amount)
    @origin = origin
    @transaction_type = transaction_type
    @destination = destination
    @amount = amount
  end

  def self.all_transactions
    @all_transactions ||= []
  end

  def self.record_transaction(transaction)
    all_transactions << transaction
  end

  def display_details
    puts "Type: #{transaction_type}"
    puts "Amount: RM#{amount}"
    if transaction_type == 'Transfer'
    	puts "Recipient: #{destination.name}" # Assuming destination has a 'name' attribute
		else
			puts "Destination: #{destination}"
		end
  end

  def self.display_transactions(user)
    user_transactions = all_transactions.select { |transaction| transaction.origin == user }

    if user_transactions.empty?
      puts "No transactions found for #{user.name}."
    else
      puts "Transaction history for #{user.name}:"
      user_transactions.each do |transaction|
        transaction.display_details
        puts "------------------------"
      end
    end
  end
end