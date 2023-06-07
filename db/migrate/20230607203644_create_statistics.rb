class CreateStatistics < ActiveRecord::Migration[6.1]
  def change
    create_table :statistics do |t|
      t.favorite_genre :total_games_played
      t.integer :hours_played
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
