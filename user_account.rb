class User
	attr_accessor :name, :account_number, :account_balance

	def initialize(name, account_number, initial_balance)
		@name = name
		@account_number = account_number
		@account_balance = initial_balance
	end
end