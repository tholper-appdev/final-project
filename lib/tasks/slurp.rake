namespace :slurp do
  desc "TODO"
  require "csv"
  
  task customers: :environment do
    Customer.delete_all
    
    csv_text = File.read(Rails.root.join("lib", "csvs", "customers.csv"))
    csv = CSV.parse(csv_text, :headers => true, :encoding => "ISO-8859-1")

    i = 1
    csv.each do |row|
      if !Customer.exists?(:username => row["username"]) && row["username"] != ""
        c = Customer.new
        c.id = i
        c.username = row["username"]
        c.lname = row["lname"]
        c.fname = row["fname"]
        
        c.save
        
        i = i + 1
      end
    end

  puts "There are now #{Customer.count} rows in the customer table"

  end  
  
  task associations: :environment do
    csv_text = File.read(Rails.root.join("lib", "csvs", "associations.csv"))
    csv = CSV.parse(csv_text, :headers => true, :encoding => "ISO-8859-1")

    csv.each do |row|
      puts row.to_hash
    end

  end

  task publications: :environment do
    csv_text = File.read(Rails.root.join("lib", "csvs", "publications.csv"))
    csv = CSV.parse(csv_text, :headers => true, :encoding => "ISO-8859-1")

    csv.each do |row|
      puts row.to_hash
    end

  end
   
  task requests: :environment do
    Request.delete_all
    
    csv_text = File.read(Rails.root.join("lib", "csvs", "requests.csv"))
    csv = CSV.parse(csv_text, :headers => true, :encoding => "ISO-8859-1")

    i = 1
    csv.each do |row|
      if !Request.exists?(:id => row["req_id"]) && row["req_id"] != "NULL"
        r = Request.new
        r.id = row["req_id"]
        r.customer_id = "1"
        r.req_date = row["req_date"]
        r.req_title= row["req_title"]
        r.save
        
        i = i + 1
      end
    end

  puts "There are now #{Request.count} rows in the requests table"

  end

end

