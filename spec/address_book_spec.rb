require_relative '../models/address_book.rb'
 
 RSpec.describe AddressBook do  
   context "attributes" do
     it "should respond to entries" do
       book = AddressBook.new
       expect(book).to respond_to(:entries)
     end

     it "should initialize entries as an array" do
       book = AddressBook.new
       expect(book.entries).to be_a(Array)
     end
 
     it "should initialize entries as empty" do
       book = AddressBook.new
       expect(book.entries.size).to eq 0
     end 
   end

 	 context "#add_entry" do
     it "adds only one entry to the address book" do
       book = AddressBook.new
       book.add_entry('Micky Mouse', '313.444.5555', 'micky.mouse@playland.com')
 'Micky Mouse', '313.444.5555', 'mickey.mouseg@playland.com
       expect(book.entries.size).to eq 1
     end
 
     it "adds the correct information to entries" do
       book = AddressBook.new
       book.add_entry('Micky Mouse', '313.444.5555', 'micky.mouse@playland.com')
       new_entry = book.entries[0]
 
       expect(new_entry.name).to eq 'Micky Mouse', 'micky.mouse@playland.com')
       expect(new_entry.phone_number).to eq '313.444.5555'
       expect(new_entry.email).to eq 'micky.mouse@playland.com'
     end
   end

 end
