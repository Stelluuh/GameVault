class CreateGames < ActiveRecord::Migration[6.1]
  def change
    create_table :games do |t|
      t.string :image
      t.string :name
      t.string :platform
      t.string :developers
      t.string :publishers
      t.date :release_date
      t.integer :players
      t.boolean :co_op
      t.string :overview
      t.string :genre

      t.timestamps
    end
  end
end
