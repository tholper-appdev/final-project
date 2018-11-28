class CreatePublications < ActiveRecord::Migration[5.1]
  def change
    create_table :publications do |t|

      t.integer :customer_id
      t.date :pubmed_date 
      t.string :pubmed_title

      t.timestamps
    end
  end
end
