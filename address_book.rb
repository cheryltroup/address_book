require_relative "controllers/menu_controller"

 menu = MenuController.new

 system "clear"
 puts "Welcome to Address Book!"

 menu.main_menu