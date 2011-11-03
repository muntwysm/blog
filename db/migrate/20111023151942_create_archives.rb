class CreateArchives < ActiveRecord::Migration
  def change
    create_table :archives do |t|
      t.references :player
      t.integer :played
      t.integer :won
      t.integer :loss
      t.integer :drawn
      t.integer :mom
      t.integer :noshow
      t.integer :points
      t.integer :rank
      t.string :season
      t.integer :champion
      t.integer :season_id
      t.text :notes

      t.timestamps
    end
    add_index :archives, :player_id
  end
end
