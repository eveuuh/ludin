class AddStatusToGamenights < ActiveRecord::Migration[5.2]
  def change
    add_column :gamenights, :status, :boolean, :null => false, :default => false
  end
end
