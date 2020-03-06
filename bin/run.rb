require_relative '../config/environment'

# welcome!
puts ""
puts "Welcome to your Adventure!"

# get the user
puts ""
puts "Who are you?"
print "> "
user_name = gets.chomp
user = User.find_or_create_by(name: user_name)

# run the app
Context.new.start(MainMenuState.new, user.id)

# after user quits
puts "Come back any time!"
Monster.all