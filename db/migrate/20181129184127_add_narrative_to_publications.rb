class AddNarrativeToPublications < ActiveRecord::Migration[5.1]
  def change
    add_column :publications, :pubmed_narrative, :string
  end
end
