require './user_account.rb'
require './bank.rb'
require './transaction.rb'

puts "Hello. Welcome to Angeline Bank"
puts "Please login with your username"
login = gets.chomp

@bank = Bank.new

if @bank.has_account?(login)
  user = @bank.find_account(login)
  puts "Welcome back, #{user.name}!"
  user.display_balance
else
  puts "You don't have an account in Angeline Bank. Do you want to create an account? (yes/no)"
  create_account_choice = gets.chomp.downcase

  if create_account_choice == "yes"
    puts "Please enter your initial balance:"
    initial_balance = gets.chomp.to_f
    @bank.create_account(login, initial_balance)
    user = @bank.find_account(login) # Assign user here
  else
    puts "Thank you for using Angeline Bank. Goodbye!"
    exit
  end
end

loop do
  @bank.display_menu
  choice = gets.chomp.to_i

  case choice
  when 1
    user.withdraw(@bank)
  when 2
    user.deposit(@bank)
  when 3
    user.transfer(@bank)
  when 4
    user.display_balance
  when 5
    Transaction.display_transactions(user)
  when 6
    puts "Do you want to login again? (yes/no)"
    login_again = gets.chomp.downcase
    if login_again == "yes"
      puts "Please login with your username"
      login = gets.chomp

      if @bank.has_account?(login)
        user = @bank.find_account(login)
        puts "Welcome back, #{user.name}!"
        user.display_balance
      else
        puts "You don't have an account in Angeline Bank. Do you want to create an account? (yes/no)"
        create_account_choice = gets.chomp.downcase

        if create_account_choice == "yes"
          puts "Please enter your initial balance:"
          initial_balance = gets.chomp.to_f
          @bank.create_account(login, initial_balance)
          user = @bank.find_account(login) # Assign user here
        else
          puts "Thank you for using Angeline Bank. Goodbye!"
          break
        end
      end
    elsif login_again == "no"
      puts "Thank you for using Angeline Bank. Goodbye!"
      break
    end
  else
    puts "Invalid choice. Please choose a number from the menu."
  end
end

