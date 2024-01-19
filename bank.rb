class Bank
	attr_accessor :accounts
	
	def initialize
		@accounts = []
	end

	def generate_account_number
		rand(10000000...19999999)
	end

	def create_account(name, initial_balance = 0)
		account_number = generate_account_number

		user = User.new(name, account_number, initial_balance)
		@accounts << user

		puts "You has succesfully created an account in ANJ Bank"
		puts "Name: #{name}"
		puts "Account number: #{account_number}"
		puts "Balance : RM#{initial_balance}"
	end
end

puts "Hello. Welcome to Angeline Bank"