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

	def transfer(bank)
		puts "Hi #{name}, your account balance is RM#{account_balance}"
		puts "Do you want to transfer to other account? Y(yes) or N(no)"
		want_transfer = gets.chomp

		case want_transfer
    when "Y"
      puts "Enter the account number of the recipient:"
      recipient_number = gets.chomp.to_i

      recipient = bank.find_account(recipient_number)

      if recipient.nil?
      	puts "Account is not exist."
      	return
      end

     	puts "Enter the amount you want to transfer"
     	amount_transfer = gets.chomp.to_f

     	if amount_transfer <= 0
				puts "Invalid amount."
				return
		 elsif amount_transfer > @account_balance
				puts "You have insufficient balance."
				return
		 else
				@account_balance -= amount_transfer
				recipient.account_balance += amount_transfer

				puts "You have have sent RM#{amount_transfer} succesfully."
				puts "Your balance: RM#{@account_balance}"
		 end

		bank.update_account(self, @account_balance)
		bank.update_recepient_account(recipient_number, recipient.account_balance)

    when "N"
      exit
    else
      puts "Invalid!"
    end
	end
end