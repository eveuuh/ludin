class CreateBoardgames < ActiveRecord::Migration[5.2]
  def change
    create_table :boardgames do |t|
      t.string :name
      t.string :category
      t.string :age
      t.integer :players_min
      t.integer :players_max
      t.text :description
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
