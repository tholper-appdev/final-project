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
    Association.delete_all
        
    csv_text = File.read(Rails.root.join("lib", "csvs", "associations.csv"))
    csv = CSV.parse(csv_text, :headers => true, :encoding => "ISO-8859-1")

    i = 1
    csv.each do |row|
        a = Association.new
        a.id = i
        a.request_id = row["req_id"]
        a.publication_id = row["pub_id"]
        a.similar_score = row["sim_score"]
        a.save
        
        i = i + 1
    end
    
    puts "There are now #{Association.count} rows in the association table"
  end

  task publications: :environment do
    Publication.delete_all
    
    csv_text = File.read(Rails.root.join("lib", "csvs", "publications.csv"))
    csv = CSV.parse(csv_text, :headers => true, :encoding => "ISO-8859-1")

    csv.each do |row|
      if !Publication.exists?(:id => row["pubmed_id"]) && row["pubmed_id"] != "NULL"
        p = Publication.new
        p.id = row["pubmed_id"]
        p.customer_id = Customer.find_by(username: row["username"]).id
        p.pubmed_date = row["pubmed_date"]
        p.pubmed_title= row["pubmed_title"]
        p.pubmed_narrative = row["narrative"]
        p.save
      end
    end

  puts "There are now #{Publication.count} rows in the publication table"
  
  end
   
  task requests: :environment do
    Request.delete_all

    csv_text = File.read(Rails.root.join("lib", "csvs", "requests.csv"))
    csv = CSV.parse(csv_text, :headers => true, :encoding => "ISO-8859-1")

    csv.each do |row|
      if !Request.exists?(:id => row["req_id"]) && row["req_id"] != "NULL"
        r = Request.new
        r.id = row["req_id"]
        
        if Customer.exists?(:username => row["username"])
          r.customer_id = Customer.find_by(username: row["username"]).id
        else
          r.customer_id = 106
        end
        
        r.req_date = row["req_date"]
        r.req_title= row["req_title"]
        r.save
      end
    end

  puts "There are now #{Request.count} rows in the request table"

  end

end

