class CreateProfiles < ActiveRecord::Migration[6.1]
  def change
    create_table :profiles do |t|
      t.string :name
      t.integer :age
      t.string :avatar
      t.string :bio
      t.integer :total_games_played
      t.string :favorite_genre
      t.integer :total_hours_played
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
