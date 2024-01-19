class User
	attr_accessor :name, :account_number, :account_balance

	def initialize(name, account_number, initial_balance)
		@name = name
		@account_number = account_number
		@account_balance = initial_balance
	end

	def withdraw(bank)
		puts "Hi #{name}, your account balance is RM#{account_balance}"
		puts "Please enter the amount you want to withdraw:"
		amount_withdraw = gets.chomp.to_f

		if amount_withdraw <= 0
			puts "Invalid amount."
			return
		elsif amount_withdraw > @account_balance
			puts "You have insufficient balance."
			return
		else
			@account_balance -= amount_withdraw
			puts "You have withdraw RM#{amount_withdraw} succesfully."
			puts "Your balance: RM#{@account_balance}"
		end

		bank.update_account(self, @account_balance)
	end

	def deposit(bank)
		puts "Hi #{name}, your account balance is RM#{account_balance}"
		puts "Please enter the amount you want to withdraw:"
		amount_deposit = gets.chomp.to_f

		if amount_deposit <= 0
			puts "Invalid amount"
			return
		else
			@account_balance += amount_deposit
			puts "You have deposit RM#{amount_deposit} in the account successfully."
			puts "Your balance: RM#{@account_balance}"
		end

		bank.update_account(self, @account_balance)
	end

	def display_balance
    puts "Hi #{name}, your account balance is RM#{account_balance}"
  end
end