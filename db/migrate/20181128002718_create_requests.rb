class CreateRequests < ActiveRecord::Migration[5.1]
  def change
    create_table :requests do |t|
      
      t.integer :customer_id 
      t.date :req_date
      t.string :req_title

      t.timestamps
    end
  end
end
