require './user_account.rb'
require './bank.rb'

puts "Hello. Welcome to Angeline Bank"
puts "Please login with your username"
login = gets.chomp

@bank = Bank.new

if @bank.has_account?(login)
  user = @bank.find_account(login)
  puts "Welcome back, #{user.name}!"
  puts "Account number: #{user.account_number}"
  puts "Balance: RM#{user.account_balance}"
else
  puts "You don't have an account in Angeline Bank. Do you want to create an account? (yes/no)"
  create_account_choice = gets.chomp.downcase

  if create_account_choice == "yes"
    puts "Please enter your initial balance:"
    initial_balance = gets.chomp.to_f
    @bank.create_account(login, initial_balance)
  else
    puts "Thank you for using Angeline Bank. Goodbye!"
  end
end