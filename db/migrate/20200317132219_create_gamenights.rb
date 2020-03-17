class CreateGamenights < ActiveRecord::Migration[5.2]
  def change
    create_table :gamenights do |t|
      t.date :date
      t.time :start_time
      t.time :end_time
      t.text :description
      t.references :location, foreign_key: true
      t.references :boardgame, foreign_key: true

      t.timestamps
    end
  end
end
