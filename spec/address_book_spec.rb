require_relative '../models/address_book.rb'
 
RSpec.describe AddressBook do  

  let(:book) { AddressBook.new }

def check_entry(entry, expected_name, expected_number, expected_email)
  expect(entry.name).to eql expected_name
  expect(entry.phone_number).to eql expected_number
  expect(entry.email).to eql expected_email
end


context "attributes" do
  it "should respond to entries" do
       
    expect(book).to respond_to(:entries)
  end

  it "should initialize entries as an array" do
      
    expect(book.entries).to be_a(Array)
  end
 
  it "should initialize entries as empty" do
     
    expect(book.entries.size).to eq 0
  end 
  end

 	context "#add_entry" do
    it "adds only one entry to the address book" do
      
      book.add_entry('Micky Mouse', '313.444.5555', 'micky.mouse@playland.com')
      expect(book.entries.size).to eq 1
    end
 
    it "adds the correct information to entries" do
      
      book.add_entry('Micky Mouse', '313.444.5555', 'micky.mouse@playland.com')
      new_entry = book.entries[0]
 
      expect(new_entry.name).to eq 'Micky Mouse'
      expect(new_entry.phone_number).to eq '313.444.5555'
      expect(new_entry.email).to eq 'micky.mouse@playland.com'
    end
  end

  context ".import_from_csv" do
    it "imports the correct number of entries" do
      book.import_from_csv("entries.csv")
      book_size = book.entries.size
      expect(book_size).to eql 5
    end

    it "imports the 1st entry" do
      book.import_from_csv("entries.csv")
      entry_one = book.entries[0]
      check_entry(entry_one, "Anne", "555-999-8888", "anne@funmail.com") 
    end

    it "imports the 2nd entry" do
      book.import_from_csv("entries.csv")
      entry_two = book.entries[1]
      check_entry(entry_two, "Betty", "555-999-7777", "betty@funmail.com")
    end
 
    it "imports the 3rd entry" do
      book.import_from_csv("entries.csv")
      entry_three = book.entries[2]
      check_entry(entry_three, "Charlene", "555-999-6666", "charlene@funmail.com")
    end
 
    it "imports the 4th entry" do
      book.import_from_csv("entries.csv")
      entry_four = book.entries[3]
      check_entry(entry_four, "Debbie", "555-999-5555", "debbie@funmail.com")
     end
 
     it "imports the 5th entry" do
       book.import_from_csv("entries.csv")
       entry_five = book.entries[4]
       check_entry(entry_five, "Ellen", "555-999-4444", "ellen@funmail.com")
     end
   end

 context "#binary_search" do
     it "searches AddressBook for a non-existent entry" do
       book.import_from_csv("entries.csv")
       entry = book.binary_search("Emily")
       expect(entry).to be_nil
     end
   end

    it "searches AddressBook for Anne" do
       book.import_from_csv("entries.csv")
       entry = book.binary_search("Anne")
       expect(entry).to be_a Entry
       check_entry(entry, "Anne", "555-999-8888", "anne@funmail.com")
     end

    it "searches AddressBook for Betty" do
       book.import_from_csv("entries.csv")
       entry = book.binary_search("Betty")
       expect(entry).to be_a Entry
       check_entry(entry, "Betty", "555-999-7777", "betty@funmail.com")
     end 
    
 
     it "searches AddressBook for Charlene" do
       book.import_from_csv("entries.csv")
       entry = book.binary_search("Charlene")
       expect(entry).to be_a Entry
       check_entry(entry, "Charlene", "555-999-6666", "charlene@funmail.com")
     end    
    
 
     it "searches AddressBook for Debbie" do
       book.import_from_csv("entries.csv")
       entry = book.binary_search("Debbie")
       expect(entry).to be_a Entry
       check_entry(entry, "Debbie", "555-999-5555", "debbie@funmail.com")
     end   
 
     it "searches AddressBook for Ellen" do
       book.import_from_csv("entries.csv")
       entry = book.binary_search("Ellen")
       expect(entry).to be_a Entry
       check_entry(entry, "Ellen", "555-999-4444", "ellen@funmail.com")
     end 

      it "searches AddressBook for Debby" do
       book.import_from_csv("entries.csv")
       entry = book.binary_search("Debby")
       expect(entry).to be_nil
     end    
    

 end
