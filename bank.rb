class Bank
	attr_accessor :accounts
	
	def initialize
		@accounts = []
	end

	def generate_account_number
		rand(10000000...19999999)
	end

	def create_account(name, initial_balance = 0)
		if has_account?(name)
      puts "Account creation failed. #{name} already has an account in Angeline Bank."
      return false
    end

		account_number = generate_account_number

		user = User.new(name, account_number, initial_balance)
		@accounts << user

		puts "You has succesfully created an account in Angeline Bank"
		puts "Name: #{name}"
		puts "Account number: #{account_number}"
		puts "Balance : RM#{initial_balance}"
	end

	def find_account(check)
    @accounts.find { |account| account.name == check || account.account_number == check }
  end

  def has_account?(check)
    !find_account(check).nil?
  end

  def remove_account(check)
  	account = find_account(check)

  	if account.nil?
  		puts "Account does not exist in the bank."
  	else
  		@accounts.delete(account)
  		puts "Account has been removed succesfully"
  	end
  end

  def update_account(account_number, updated_balance)
	  user_account = @accounts.find { |account| account.account_number == account_number }
	  user_account.account_balance = updated_balance
	end

   def display_menu
    puts "\n1. Withdraw"
    puts "2. Deposit"
    puts "3. Transfer"
    puts "4. Check Balance"
    puts "5. Display your Transactions"
    puts "6. Exit"
  end
end