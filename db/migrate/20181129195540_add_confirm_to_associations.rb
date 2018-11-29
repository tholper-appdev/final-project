class AddConfirmToAssociations < ActiveRecord::Migration[5.1]
  def change
    add_column :associations, :confirm, :boolean, :default => false
  end
end
