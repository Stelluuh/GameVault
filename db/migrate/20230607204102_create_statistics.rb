class CreateStatistics < ActiveRecord::Migration[6.1]
  def change
    create_table :statistics do |t|
      t.integer :total_games_played
      t.string :favorite_genre
      t.integer :hours_played
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
