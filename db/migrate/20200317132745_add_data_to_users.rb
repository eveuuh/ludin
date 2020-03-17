class AddDataToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :username, :string
    add_column :users, :presentation, :text
    add_column :users, :global_rating, :float
  end
end
