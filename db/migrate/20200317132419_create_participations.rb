class CreateParticipations < ActiveRecord::Migration[5.2]
  def change
    create_table :participations do |t|
      t.integer :rating
      t.text :description
      t.references :user, foreign_key: true
      t.references :gamenight, foreign_key: true

      t.timestamps
    end
  end
end
