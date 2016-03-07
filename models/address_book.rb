require_relative "entry.rb"
require "csv"
 
class AddressBook	
# The AddressBook class adds instances of the Entry class to represent a contact in an address book	
 
  attr_accessor :entries
 
 	def initialize
     @entries = []
  end

  # Adds an entry into the global array that is our address book
  #   @param: name,  the string represenation of a person's name
  #   @param: phone, an integer representation of the peron's phone number
  #   @param: email, the string representation of the person's email
  def add_entry(name, phone, email)
    index = 0

    # if the new entry name comes before the current entry, break from 
    #   the loop to insert into it's alphabetical order
    @entries.each do |entry|
      if name < entry.name
        break
      end
       index += 1
     end

    # add the entry
     @entries.insert(index, Entry.new(name, phone, email))
  end

  # Reads from a specified CSV file to parse and create an Entry
  #   @param: file_name, the relative(or absolute?) path of the file to use
  def import_from_csv(file_name)
    begin
    # read the file
    csv_text = File.read(file_name)
    rescue CSV::MalformedCSVError
    end

    begin
    # parse the file
    csv = CSV.parse(csv_text, headers: true, skip_blanks: true)
    rescue CSV::MalformedCSVError
    end

    # create an Entry out of each CSV row
    csv.each do |row|
      row_hash = row.to_hash
      add_entry(row_hash["name"], row_hash["phone_number"], row_hash["email"])
    end
  end

  # Leverage Binary Search to retrieve the Entry for the specified name
  #   @param: name, the Entry we are looking for
  def binary_search(name)
     lower = 0
     upper = entries.length - 1

     # binary search
     while lower <= upper
      mid = (lower + upper) / 2
      mid_name = entries[mid].name
 
      if name == mid_name
      # found it! so return the Entry
        return entries[mid]
      elsif name < mid_name
        upper = mid - 1
      elsif name > mid_name
        lower = mid + 1
      end
    end

  # no Entry found, returns nil
    return nil
  end
end