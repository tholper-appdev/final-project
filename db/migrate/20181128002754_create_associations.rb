class CreateAssociations < ActiveRecord::Migration[5.1]
  def change
    create_table :associations do |t|
      t.integer :request_id
      t.integer :publication_id
      t.float :similar_score

      t.timestamps
    end
  end
end
