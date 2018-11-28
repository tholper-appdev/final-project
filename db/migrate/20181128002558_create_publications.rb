class CreatePublications < ActiveRecord::Migration[5.1]
  def change
    create_table :publications do |t|
      t.integer :user_id
      t.integer :pubmed_id

      t.timestamps
    end
  end
end
