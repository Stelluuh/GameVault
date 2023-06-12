class CreateGameLogs < ActiveRecord::Migration[6.1]
  def change
    create_table :game_logs do |t|
      t.integer :status
      t.integer :rating
      t.date :date_started
      t.date :date_stopped
      t.date :date_completed
      t.integer :play_time
      t.references :game, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
