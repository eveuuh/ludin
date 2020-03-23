class AddInfosToGamenights < ActiveRecord::Migration[5.2]
  def change
    add_column :gamenights, :latitude, :float
    add_column :gamenights, :longitude, :float
  end
end
