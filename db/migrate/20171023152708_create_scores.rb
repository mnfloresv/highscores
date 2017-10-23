class CreateScores < ActiveRecord::Migration[5.1]
  def change
    create_table :scores do |t|
      t.string :player_email
      t.integer :score
      t.references :game, foreign_key: true

      t.timestamps
    end
  end
end
